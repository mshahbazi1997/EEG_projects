import os
import re
import csv
import warnings
import numpy as np
import scipy.io
from collections import Counter
import matplotlib.pyplot as plt
import matplotlib.animation as animation

import mne
from mne import create_info, EpochsArray
from mne.time_frequency.stft import stft, stftfreq, stft_norm2
from mne.time_frequency import tfr_morlet, tfr_multitaper, psd_multitaper
from mne.connectivity import spectral_connectivity, phase_slope_index
from mne.viz import circular_layout, plot_connectivity_circle
import pyedflib
import pyeeg
from biosppy.signals import eeg

from scipy import signal
from scipy.stats import spearmanr, pearsonr
from pywt import wavedec
from sklearn.preprocessing import normalize
from sklearn.decomposition import PCA
from sklearn.svm import SVC
from sklearn.discriminant_analysis import QuadraticDiscriminantAnalysis
from sklearn.neural_network import MLPClassifier
from sklearn.naive_bayes import GaussianNB, BernoulliNB, MultinomialNB
from sklearn.ensemble import RandomForestClassifier, RandomForestRegressor
from sklearn.neighbors import KNeighborsClassifier, NearestCentroid, KernelDensity
from sklearn.cluster import KMeans, SpectralClustering, spectral_clustering
from sklearn.linear_model import LogisticRegression, RidgeClassifier, SGDClassifier, Perceptron, PassiveAggressiveClassifier
from sklearn.kernel_ridge import KernelRidge
from sklearn.metrics import mean_squared_error, r2_score, confusion_matrix, accuracy_score, f1_score, cohen_kappa_score, roc_curve, roc_auc_score, adjusted_rand_score, adjusted_mutual_info_score, homogeneity_completeness_v_measure, fowlkes_mallows_score, silhouette_score, calinski_harabaz_score
from sklearn.model_selection import cross_val_score

# patients = ['chb01', 'chb02', 'chb03', 'chb04', 'chb05', 'chb06', 'chb07', 'chb08', 'chb09', 'chb10', 'chb11', 'chb12', 'chb13', 'chb14', 'chb15', 'chb16', 'chb17', 'chb18', 'chb19', 'chb20', 'chb21', 'chb22', 'chb23', 'chb24']
channel_names = ['FP1-F7', 'F7-T7', 'T7-P7', 'P7-O1', 'FP1-F3', 'F3-C3', 'C3-P3', 'P3-O1', 'FP2-F4', 'F4-C4', 'C4-P4', 'P4-O2', 'FP2-F8', 'F8-T8', 'T8-P8-0', 'P8-O2', 'FZ-CZ', 'CZ-PZ', 'P7-T7', 'T7-FT9', 'FT9-FT10', 'FT10-T8', 'T8-P8-1']
channel_names_car = ['FP1', 'F7', 'T7', 'P7', 'O1', 'P3', 'C3', 'F3', 'FP2', 'F8', 'T8', 'P8', 'O2', 'P4', 'C4', 'F4', 'FT9', 'FT10']
channel_proj_mat = np.linalg.inv([
[1,-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 1,-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 1,-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 1,-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[1, 0, 0, 0, 0, 0, 0,-1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0,-1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0,-1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,-1, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,-1, 1, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,-1, 1, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,-1, 1, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 1,-1, 0, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 1,-1, 0, 0, 0, 0, 0, 0, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,-1, 0, 0, 0, 0, 0, 0],
[0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,-1, 0],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,-1],
[0, 0, 0, 0, 0, 0, 0, 0, 0, 0,-1, 0, 0, 0, 0, 0, 0, 1],
[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]])
preictal_threshold = 600
interictal_threshold = 30
window_size = 100
preictal_window_shift = 0.5
interictal_window_shift = 2
con_window_size = 2
con_window_shift = 0.2
freq_limit_low = (4, 8, 14)
freq_limit_high = (7, 13, 30)
cwt_freqs = np.arange(4, 30, 1)
cwt_n_cycles = cwt_freqs / 20.

# project into common average reference
def re_reference(eeg_data):

    # extract the data
    eeg_data_left = eeg_data[0:7,:]
    eeg_data_right = eeg_data[8:15,:]
    eeg_data_cross = eeg_data[19:22,:]
    eeg_data_lr = np.append(eeg_data_left, eeg_data_right, 0)
    eeg_data_lrc = np.append(eeg_data_lr, eeg_data_cross, 0)
    eeg_data_corrected = np.append(eeg_data_lrc, np.zeros((1,eeg_data.shape[1])),0)
    
    # project to new ref
    eeg_data_reref = np.matmul(channel_proj_mat,eeg_data_corrected)
    
    return eeg_data_reref

# update figure    
def coherence_updatefig(idx):

    con_img.set_array(con_data[idx])
    
    return [con_img]

# visualize the connectivity matrix
def visualize_connectivity(connectivity_matrix):

    global con_data, con_img
    con_data = np.transpose(connectivity_matrix,(0,2,1))
    fig = plt.figure()
    con_img = plt.imshow(con_data[0], interpolation='nearest', aspect='auto', cmap=plt.get_cmap('jet'), vmin=0, vmax=1)
    ani = animation.FuncAnimation(fig, coherence_updatefig, frames=range(con_data.shape[0]), interval=200, blit=True, repeat=False)
    # plt.imshow(np.transpose(con_data[:,:,28],(1,0)), interpolation='nearest', aspect='auto', cmap=plt.get_cmap('jet'), vmin=0, vmax=1)
    plt.show()
    
# extract data from the sample's files
def preictal_extract(preictal_cons, addr):

    print (re.sub('.edf', '', re.search('\chb[0-9]{2}_[0-9]{2}.edf', addr).group(0)))
    
    # read the info file
    subject_addr = re.sub('\chb[0-9]{2}_[0-9]{2}.edf', '', addr)
    for file in os.listdir(subject_addr):
        if file.endswith('.txt'):
            info_file_addr = os.path.join(subject_addr, file)
    f = open(info_file_addr)
    info_file_content = f.read()

    # extract the seizure timing from file
    file_name = re.search('chb[0-9]{2}_[0-9]{2}.edf', addr).group(0)
    info_pattern = 'File Name: ' + file_name + '\nFile Start Time: [0-9]+:[0-9]+:[0-9]+\nFile End Time: [0-9]+:[0-9]+:[0-9]+\nNumber of Seizures in File: 1\nSeizure [1 ]*Start Time: [0-9]+ seconds\nSeizure [1 ]*End Time: [0-9]+ seconds\n'
    info = re.search(info_pattern, info_file_content).group(0)
    seizure_start_pattern = 'Start Time: [0-9]+ seconds'
    seizure_end_pattern = 'End Time: [0-9]+ seconds'
    seizure_start_text = re.search(seizure_start_pattern, info).group(0)
    seizure_end_text = re.search(seizure_end_pattern, info).group(0)
    seizure_start_time = np.int(re.search('[0-9]+', seizure_start_text).group(0))
    seizure_end_time = np.int(re.search('[0-9]+', seizure_end_text).group(0))
    
    # read the edf file
    raw = mne.io.read_raw_edf(addr, preload=True, verbose='ERROR')
    
    # check channel names, sampling freq, and preictal timing
    if raw.ch_names!=channel_names or raw.info['sfreq']!=256.0:
        error('Invalid Sample!')
    
    # calculate the connectivity
    eeg_data = re_reference(raw.get_data())
    preictal_con = []
    window_center = np.int((seizure_start_time-con_window_size/2)*raw.info['sfreq'])
    while (window_center - np.int((con_window_size/2)*raw.info['sfreq'])) >= np.int((seizure_start_time-preictal_threshold)*raw.info['sfreq']) and (window_center - np.int((con_window_size/2)*raw.info['sfreq'])) >= 0:
        window_start = window_center - np.int((con_window_size/2)*raw.info['sfreq'])
        window_end = window_center + np.int((con_window_size/2)*raw.info['sfreq'])
        window_eeg = np.expand_dims(eeg_data[:,window_start:window_end],axis=0)
        try:
            con, freqs, times, _, _  = spectral_connectivity(window_eeg, method='coh', mode='multitaper', sfreq=raw.info['sfreq'], fmin=freq_limit_low, fmax=freq_limit_high, faverage=True, n_jobs=1, verbose='Warning')
            # con, freqs, times, _, _ = phase_slope_index(window_eeg, mode='multitaper', sfreq=raw.info['sfreq'], fmin=freq_limit_low, fmax=freq_limit_high, n_jobs=1, verbose='Warning')
        except:
            error('Wrong Connectivity!')
        
        # remove zero elements
        del_idx = []
        for row in range(con.shape[0]):
            for col in range(con.shape[1]):
                if row<=col:
                    del_idx.append(row*con.shape[1]+col)
        con = np.reshape(con,(con.shape[0]*con.shape[1],con.shape[2]))
        con = np.delete(con,del_idx,0)
        preictal_con.append(con)
        window_center = window_center - np.int(con_window_shift*raw.info['sfreq'])
    preictal_con = np.asarray(preictal_con)
    preictal_cons.append(preictal_con)
    print('\tPreictal: ', np.asarray(preictal_cons).shape[0])

    # visualize the connectivity matrix
    # visualize_connectivity(preictal_con)
    
    return preictal_cons

# extract data from the sample's files
def interictal_extract(interictal_cons, addr):

    global con_data, con_img
    print (re.sub('.edf', '', re.search('\chb[0-9]{2}_[0-9]{2}.edf', addr).group(0)))
    
    # read the edf file
    raw = mne.io.read_raw_edf(addr, preload=True, verbose='ERROR')
    
    # check channel names, sampling freq, and preictal timing
    if raw.ch_names!=channel_names or raw.info['sfreq']!=256.0:
        error('Invalid Sample!')
    
    # calculate the connectivity
    eeg_data = re_reference(raw.get_data())    
    interictal_con = []
    window_center = np.int((con_window_size/2)*raw.info['sfreq'])
    while window_center + np.int((con_window_size/2)*raw.info['sfreq']) < eeg_data.shape[1]:
        window_start = window_center - np.int((con_window_size/2)*raw.info['sfreq'])
        window_end = window_center + np.int((con_window_size/2)*raw.info['sfreq'])
        window_eeg = np.expand_dims(eeg_data[:,window_start:window_end],axis=0)
        try:
            con, freqs, times, n_epochs,  n_tapers  = spectral_connectivity(window_eeg, method='coh', mode='multitaper', sfreq=raw.info['sfreq'], fmin=freq_limit_low, fmax=freq_limit_high, faverage=True, n_jobs=1, verbose='Warning')
            # con, freqs, times, _, _ = phase_slope_index(window_eeg, mode='multitaper', sfreq=raw.info['sfreq'], fmin=freq_limit_low, fmax=freq_limit_high, n_jobs=1, verbose='Warning')
        except:
            error('Wrong Connectivity!')
        
        # remove zero elements
        del_idx = []
        for row in range(con.shape[0]):
            for col in range(con.shape[1]):
                if row<=col:
                    del_idx.append(row*con.shape[1]+col)
        con = np.reshape(con,(con.shape[0]*con.shape[1],con.shape[2]))
        con = np.delete(con,del_idx,0)
        interictal_con.append(con)
        window_center = window_center + np.int(con_window_shift*raw.info['sfreq'])
    interictal_con = np.asarray(interictal_con)
    interictal_cons.append(interictal_con)
    print('\tInterictal: ', np.asarray(interictal_cons).shape[0])

    # visualize the connectivity matrix
    # visualize_connectivity(interictal_con)
    
    return interictal_cons
    
# remove nans from data
def nan_removal(cons):
    
    del_idx = []
    for sample_idx in range(0,cons.shape[0]):
        if np.isnan(cons[sample_idx]).any():
            del_idx.append(sample_idx)
    cons = np.delete(cons,del_idx,0)
    
    return cons
    
# normalize the cons
def normalize_cons(cons):

    sample_cons = []
    for sample in range(0,cons.shape[0]):
        channel_pair_cons = []
        for channel_pair in range(0,cons.shape[1]):
            features = cons[sample,channel_pair,:,:]
            features = normalize(features, norm='l1', axis=0, copy=True, return_norm=False)
            channel_pair_cons.append(features)
        sample_cons.append(channel_pair_cons)
    cons = np.asarray(sample_cons)
    
    return cons

# extract the wavelet features
def wavelet_decomposition(cons):

    wavelet_family = 'db1'
    wavelet_level = 2
    sample_cons = []
    for sample in range(0,cons.shape[0]):
        channel_pair_cons = []
        for channel_pair in range(0,cons.shape[1]):
            freq_cons = []
            for freq in range(0,cons.shape[2]):
                signal = cons[sample,channel_pair,freq,:]
                features = np.hstack(wavedec(signal, wavelet=wavelet_family, mode='symmetric', level=wavelet_level))
                freq_cons.append(features)
            channel_pair_cons.append(freq_cons)
        sample_cons.append(channel_pair_cons)
    cons = np.asarray(sample_cons)
    
    return cons
    
# load data
def load_data(pid):

    # select some patients
    base_addr = 'C:\Users\mahdi\Desktop\Dataset\MIT\\'
    
    # extract the subject age from file
    # with open('SUBJECT-INFO.txt', 'r') as f:
        # subjects_info =f.read().replace('\n', '')
    # subject_info = re.search(pid+'\t\w\t[0-9]+\.[0-9]+', subjects_info).group(0)
    # subject_age = np.float(re.search('[0-9]+\.[0-9]+', subject_info).group(0))
    
    # reload the array
    if reload == True:
        
        patients = ['chb01', 'chb02', 'chb03', 'chb05', 'chb07', 'chb08', 'chb10']
        for patient in patients:
        
            # extract preictal data
            preictal_cons = []
            with open('RECORDS-WITH-SEIZURES.txt') as f:
                content = f.readlines()
            seizure_records = [x.strip() for x in content]
            for record_addr in seizure_records:
                addr = base_addr + record_addr.replace('/','\\')
                if patient in record_addr:
                    preictal_cons = preictal_extract(preictal_cons, addr)
            
            # save to file
            preictal_cons = np.asarray(preictal_cons)
            np.save('dataset\\'+patient+'preictal_cons.npy', preictal_cons)
            preictal_cons = []
            
            # extract interictal data
            interictal_cons = []
            with open('RECORDS-WITHOUT-SEIZURES.txt') as f:
                content = f.readlines()
            nonseizure_records = [x.strip() for x in content]
            for record_addr in nonseizure_records:
                addr = base_addr + record_addr.replace('/','\\')        
                if patient in record_addr:
                    interictal_cons = interictal_extract(interictal_cons, addr)
            
            # save to file
            interictal_cons = np.asarray(interictal_cons)
            np.save('dataset\\'+patient+'interictal_cons.npy', interictal_cons)
            interictal_cons = []
        
    # load from file
    else:
    
        preictal_cons = np.load('dataset\\'+pid+'preictal_cons.npy')
        interictal_cons = np.load('dataset\\'+pid+'interictal_cons.npy')
        # preictal_cons = np.transpose(preictal_cons,(0,2,3,1))
        # interictal_cons = np.transpose(interictal_cons,(0,2,3,1))
    
    # remove possible nans
    preictal_cons = nan_removal(preictal_cons)
    interictal_cons = nan_removal(interictal_cons)
    
    # normalize the cons
    # preictal_cons = normalize_cons(preictal_cons)
    # interictal_cons = normalize_cons(interictal_cons)
    
    # extract wavelet features
    # preictal_cons = wavelet_decomposition(preictal_cons)
    # interictal_cons = wavelet_decomposition(interictal_cons)
    
    # visualize the connectivity matrix
    # visualize_connectivity(preictal_cons[0])
    
    return preictal_cons, interictal_cons
    
# extract samples from connectivity matrices
def extract_samples(preictal_cons, interictal_cons):
    
    # extract preictal samples
    preictal_samples = []
    for session_idx in range(preictal_cons.shape[0]):
        preictal_con = preictal_cons[session_idx]
        window_center = np.int(window_size/2)
        while window_center + np.int(window_size/2) <= preictal_con.shape[0]:
            window_start = window_center - np.int(window_size/2)
            window_end = window_center + np.int(window_size/2)
            window_con = preictal_con[window_start:window_end,:,:]
            preictal_samples.append(window_con[::-1,:,:])
            window_center = window_center + np.int(preictal_window_shift*window_size)
    preictal_samples = np.asarray(preictal_samples)
    
    # extract interictal samples
    interictal_samples = []
    for session_idx in range(interictal_cons.shape[0]):
        interictal_con = interictal_cons[session_idx]
        window_center = np.int(window_size/2)
        while window_center + np.int(window_size/2) <= interictal_con.shape[0]:
            window_start = window_center - np.int(window_size/2)
            window_end = window_center + np.int(window_size/2)
            window_con = interictal_con[window_start:window_end,:,:]
            interictal_samples.append(window_con)
            window_center = window_center + np.int(interictal_window_shift*window_size)
    interictal_samples = np.asarray(interictal_samples)
    
    return preictal_samples, interictal_samples
    
# split the train and test data, then balance the classes by either upsampling preictal or downsampling interictal
def train_test_split(preictal_samples, interictal_samples, preictal_labels, interictal_labels):

    # parameters
    test_proportion = 0.2
    up_down = 'train_down'
    
    # split the data into training/testing sets
    indices = np.random.permutation(preictal_samples.shape[0])
    preictal_n_test = np.int(test_proportion*preictal_samples.shape[0])
    train_idx = indices[:-preictal_n_test]
    test_idx = indices[-preictal_n_test:]
    preictal_samples_train = preictal_samples[train_idx,:]
    preictal_samples_test = preictal_samples[test_idx,:]
    preictal_labels_train = preictal_labels[train_idx]
    preictal_labels_test = preictal_labels[test_idx]
    
    indices = np.random.permutation(interictal_samples.shape[0])
    interictal_n_test = np.int(test_proportion*interictal_samples.shape[0])
    train_idx = indices[:-interictal_n_test]
    test_idx = indices[-interictal_n_test:]
    interictal_samples_train = interictal_samples[train_idx,:]
    interictal_samples_test = interictal_samples[test_idx,:]
    interictal_labels_train = interictal_labels[train_idx]
    interictal_labels_test = interictal_labels[test_idx]
        
    # upsample the train data
    if up_down=='train_up':
        temp_preictal_samples_train = []
        temp_preictal_labels_train = []
        for repeat_idx in range(np.int(interictal_samples_train.shape[0]/preictal_samples_train.shape[0])):
            [temp_preictal_samples_train.append(preictal_samples_train[sample_idx]) for sample_idx in range(preictal_samples_train.shape[0])]
            [temp_preictal_labels_train.append(preictal_labels_train[sample_idx]) for sample_idx in range(preictal_labels_train.shape[0])]
        preictal_samples_train = np.asarray(temp_preictal_samples_train)
        preictal_labels_train = np.asarray(temp_preictal_labels_train)
        
    # downsample the train data
    elif up_down=='train_down':
        n_down = preictal_samples_train.shape[0]
        interictal_indices_train = np.random.permutation(interictal_samples_train.shape[0])
        interictal_indices_train = interictal_indices_train[0:n_down]
        interictal_samples_train = interictal_samples_train[interictal_indices_train]
        interictal_labels_train = interictal_labels_train[interictal_indices_train]
    
    # downsample both the train and test data
    elif up_down=='all_down':
        n_down = preictal_samples_train.shape[0]
        interictal_indices_train = np.random.permutation(interictal_samples_train.shape[0])
        interictal_indices_train = interictal_indices_train[0:n_down]
        interictal_samples_train = interictal_samples_train[interictal_indices_train]
        interictal_labels_train = interictal_labels_train[interictal_indices_train]
        n_down = preictal_samples_test.shape[0]
        interictal_indices_test = np.random.permutation(interictal_samples_test.shape[0])
        interictal_indices_test = interictal_indices_test[0:n_down]
        interictal_samples_test = interictal_samples_test[interictal_indices_test]
        interictal_labels_test = interictal_labels_test[interictal_indices_test]
    
    return preictal_samples_train, preictal_samples_test, interictal_samples_train, interictal_samples_test, preictal_labels_train, preictal_labels_test, interictal_labels_train, interictal_labels_test

# evaluate the classification result    
def evaluate_classification(labels_tests, labels_preds, probas_preds):

    labels_tests = np.asarray(labels_tests)
    labels_preds = np.asarray(labels_preds)
    probas_preds = np.asarray(probas_preds)
    probas_preds = probas_preds[:,1]
    cnf = confusion_matrix(labels_tests, labels_preds)
    accuracy = accuracy_score(labels_tests, labels_preds)
    f1 = f1_score(labels_tests, labels_preds)
    print(cnf, accuracy, f1)
    
    auc = roc_auc_score(labels_tests, probas_preds)
    fpr, tpr, _ = roc_curve(labels_tests, probas_preds)
    plt.figure()
    plt.plot(fpr, tpr, color='darkorange', lw=2, label='ROC curve (area = %0.2f)' % auc)
    plt.plot([0, 1], [0, 1], color='navy', lw=2, linestyle='--')
    plt.xlim([-0.02, 1.0])
    plt.ylim([0.0, 1.03])
    plt.xlabel('False Positive Rate')
    plt.ylabel('True Positive Rate')
    plt.title('Receiver Operating Characteristic')
    plt.legend(loc="lower right")
    plt.show()

def preictal_classification(pid, preictal_cons, interictal_cons):

    print (pid)
    
    # extract samples from the connectivity matrices
    preictal_samples, interictal_samples = extract_samples(preictal_cons, interictal_cons)
    
    # reshape
    preictal_samples = preictal_samples.reshape((preictal_samples.shape[0],preictal_samples.shape[1]*preictal_samples.shape[2]*preictal_samples.shape[3]))
    interictal_samples = interictal_samples.reshape((interictal_samples.shape[0],interictal_samples.shape[1]*interictal_samples.shape[2]*interictal_samples.shape[3]))
    
    # generate labels
    preictal_labels = np.array([ 1 for preictal_sample in preictal_samples])
    interictal_labels = np.array([ 0 for interictal_sample in interictal_samples])
    
    n_repeat = 5
    labels_tests = []
    labels_preds = []
    probas_preds = []
    for test_idx in range(n_repeat):
    
        print(test_idx)
        
        # split and balance the classes
        preictal_samples_train, preictal_samples_test, interictal_samples_train, interictal_samples_test, preictal_labels_train, preictal_labels_test, interictal_labels_train, interictal_labels_test = train_test_split(preictal_samples, interictal_samples, preictal_labels, interictal_labels)
        
        samples_train = np.concatenate((preictal_samples_train, interictal_samples_train), axis=0)
        samples_test = np.concatenate((preictal_samples_test, interictal_samples_test), axis=0)
    
        labels_train = np.concatenate((preictal_labels_train, interictal_labels_train), axis=0)
        labels_test = np.concatenate((preictal_labels_test, interictal_labels_test), axis=0)
        labels_tests.extend(labels_test)
        
        # fit the classifier
        # clf = RandomForestClassifier(max_depth=100, class_weight='balanced_subsample')
        # clf = SVC()
        # clf = GaussianNB()
        # clf = QuadraticDiscriminantAnalysis()
        # clf = KNeighborsClassifier(n_neighbors=3)
        # clf = MLPClassifier(hidden_layer_sizes=(25,5,))
        clf = LogisticRegression(C=1e0, class_weight='balanced')
        # clf = RidgeClassifier(tol=1e-2, solver="lsqr")
        # clf = PassiveAggressiveClassifier(n_iter=50)
        # clf = SGDClassifier(alpha=.0001, n_iter=50, penalty="elasticnet")
        # clf = MultinomialNB(alpha=.01)
        # clf = KernelRidge(alpha=1.0)
        # kde = KernelDensity(bandwidth=0.04, metric='haversine', kernel='gaussian', algorithm='ball_tree')
        # kde.fit(cons_train[labels_train == 0])
        # kde.score_samples(cons_train)
        
        clf.fit(samples_train, labels_train)
        labels_pred = clf.predict(samples_test)
        labels_preds.extend(labels_pred)
        probas_pred = clf.predict_proba(samples_test)
        probas_preds.extend(probas_pred)
        
    # evaluate the result
    evaluate_classification(labels_tests, labels_preds, probas_preds)

def preictal_clustering(pid, preictal_cons, interictal_cons):

    print (pid)
    
    # extract samples from the connectivity matrices
    preictal_samples, interictal_samples = extract_samples(preictal_cons, interictal_cons)
    
    # reshape
    preictal_samples = preictal_samples.reshape((preictal_samples.shape[0],preictal_samples.shape[1]*preictal_samples.shape[2]*preictal_samples.shape[3]))
    interictal_samples = interictal_samples.reshape((interictal_samples.shape[0],interictal_samples.shape[1]*interictal_samples.shape[2]*interictal_samples.shape[3]))
    
    # generate labels
    preictal_labels = np.array([ 1 for preictal_con in preictal_cons])
    interictal_labels = np.array([ 0 for interictal_con in interictal_cons])
    
    # downsample the classes
    # preictal_cons, interictal_cons, preictal_labels, interictal_labels = balance(preictal_cons, interictal_cons, preictal_labels, interictal_labels)
    
    # fit the classifier
    samples = np.concatenate((preictal_samples, interictal_samples), axis=0)
    labels = np.concatenate((preictal_labels, interictal_labels), axis=0)
    # clus = KMeans(n_clusters=5, init='k-means++')
    clus = SpectralClustering(n_clusters=2, eigen_solver='arpack', affinity="nearest_neighbors")
    labels_pred = clus.fit_predict(samples)
    
    # evaluate the result
    ari = adjusted_rand_score(labels, labels_pred)
    ami = adjusted_mutual_info_score(labels, labels_pred)
    h, c, v = homogeneity_completeness_v_measure(labels, labels_pred)
    # fmi = fowlkes_mallows_score(labels, labels_pred)
    sil = silhouette_score(samples, labels_pred, metric='euclidean')
    cal = calinski_harabaz_score(samples, labels_pred)
    print ('ari=%.2f, ' % ari, 'ami=%.2f, ' % ami, 'h=%.2f, ' % h, 'c=%.2f, ' % c, 'v=%.2f, ' % v, 'sil=%.2f, ' % sil, 'cal=%.2f' % cal)

# program main
if __name__ == '__main__':
    
    reload = False
    
    pid = 'chb03'
    preictal_cons, interictal_cons = load_data(pid)
    
    # reshape
    # preictal_cons = preictal_cons.reshape((preictal_cons.shape[0],preictal_cons.shape[1]*preictal_cons.shape[2]*preictal_cons.shape[3]))
    # pca = PCA(n_components=10)
    # pca.fit(preictal_cons)
    # print(pca.explained_variance_ratio_)
    
    # age_regression(preictal_cons, preictal_ages)
    # age_classification(preictal_cons, preictal_ages)
    
    # age_regression(interictal_cons, interictal_ages)
    # age_classification(interictal_cons, interictal_ages)
    
    preictal_classification(pid, preictal_cons, interictal_cons)
    # preictal_clustering(pid, preictal_cons, interictal_cons)
    