import pandas as pd
import matplotlib.pyplot as plt
from sklearn.metrics import *
# plt.style.use('ggplot')

def plot_ph_conductivity(data: pd.DataFrame, dataset_name: str, path_to_save: str):
    num_graphs = int(len(data.columns)/2)
    
    for iteration in range(num_graphs):
        if iteration == 0:
            tmp_label = 'feed'
            columns_num = 1
        else:
            tmp_label = f'premeate {iteration}'
            columns_num = iteration+2
        plt.plot(data[data.columns[columns_num]].values, data[data.columns[columns_num+1]].values, label=f'pH/Conductivity {tmp_label}')
    plt.legend()
    plt.title(f'pH/Conductivity plot for {dataset_name} dataset')
    plt.xlabel('pH')
    plt.ylabel('Conductivity')
    plt.savefig(path_to_save, format='svg', dpi=1200)
    plt.close()
    
def plot_time_ph(data: pd.DataFrame, dataset_name: str, path_to_save: str):
    num_graphs = int(len(data.columns)/2)
    
    for iteration in range(num_graphs):
        if iteration == 0:
            tmp_label = 'feed'
            columns_num = 1
        else:
            tmp_label = f'premeate {iteration}'
            columns_num = iteration+2
        plt.plot(data[data.columns[0]].values, data[data.columns[columns_num]].values, label=f'time/pH {tmp_label}')
    plt.legend()
    plt.title(f'Time/pH plot for {dataset_name} dataset')
    plt.xlabel('Time')
    plt.ylabel('pH')
    plt.savefig(path_to_save, format='svg', dpi=1200)
    plt.close()
    
def plot_time_conductivity(data: pd.DataFrame, dataset_name: str, path_to_save: str):
    num_graphs = int(len(data.columns)/2)
    
    for iteration in range(num_graphs):
        if iteration == 0:
            tmp_label = 'feed'
            columns_num = 2
        else:
            tmp_label = f'premeate {iteration}'
            columns_num = iteration+3
        plt.plot(data[data.columns[0]].values, data[data.columns[columns_num]].values, label=f'Time/Conductivity {tmp_label}')
    plt.legend()
    plt.title(f'Time/Conductivity plot for {dataset_name} dataset')
    plt.xlabel('Time')
    plt.ylabel('Conductivity')
    plt.savefig(path_to_save, format='svg', dpi=1200)
    plt.close()
    
    
def plot_model_pred_vs_real_data(data: pd.DataFrame, model, start_value: int = 0, reverse_x_axis=True, time = False):
    
    plt.rcParams.update({'font.size': 20})
    
    X_data = data[data.columns[-1]].values
    y_data = data[data.columns[0]].values
    
    model.eval()
    preds = []
    for value in X_data:
        pred = model.predict([value])
        preds.append(pred)
        
    fig, axs = plt.subplots(2, figsize=(12, 10))
    fig.suptitle('Model evaluation', fontsize='30')

    axs[0].plot(X_data[:start_value], y_data[:start_value], label='Real data start')
    axs[0].plot(X_data[start_value:], preds[start_value:], label='Predicted by model')
    axs[0].set_title('Finishing graph by model')
    if reverse_x_axis:
        axs[0].invert_xaxis()
    axs[0].set(xlabel='Conductivity (mS/cm)', ylabel='pH')
    axs[0].legend()
    
    if not time is False:
        left, bottom, width, height = [0.3, 0.65, 0.35, 0.2]
        ax_2 = fig.add_axes([left, bottom, width, height])
        ax_2.plot(time, y_data, label='Real Feed')
        ax_2.plot(time, preds, label='Predicted Feed')
        # if reverse_x_axis:
        #     ax_2.invert_xaxis()
        ax_2.set(xlabel='Time (hours)', ylabel='pH')
        ax_2.legend()
    else:
        left, bottom, width, height = [0.3, 0.65, 0.35, 0.2]
        ax_2 = fig.add_axes([left, bottom, width, height])
        ax_2.plot(X_data, y_data, label='real data')
        ax_2.plot(X_data, preds, label='predicted data')
        if reverse_x_axis:
            ax_2.invert_xaxis()
        ax_2.set(xlabel='Conductivity (mS/cm)', ylabel='pH')
        ax_2.legend()
    
    # axs[1].plot(X_data, y_data, label='real data')
    # axs[1].plot(X_data, preds, label='predicted data')
    # axs[1].set_title('Real data vs predicted by model')
    # if reverse_x_axis:
    #     axs[1].invert_xaxis()
    # axs[1].set(xlabel='Conductivity (mS/cm)', ylabel='pH')
    # axs[1].legend()
    
    axs[1].plot(y_data, y_data, linestyle='--', color='red')
    axs[1].scatter(y_data, preds, color='blue', s=3)
    axs[1].set_title('Regression plot')
    axs[1].set(xlabel='True values', ylabel='Predicted values')
    
    textstr = 'R2=%.2f\nMAE=%.2f\nMSE=%.2f'%(round(r2_score(y_data, preds), 2), round(mean_absolute_error(y_data, preds), 2), round(mean_squared_error(y_data, preds), 2))
    probs = dict(boxstyle='round', facecolor='wheat', alpha=0.5)
    
    axs[1].text(0.05, 0.95, textstr, transform=axs[1].transAxes, fontsize=14, verticalalignment='top', bbox=probs)
    
    fig.tight_layout()
    return fig

def plot_regression_true_vs_predicted(data, model, r2=False, mae=False, mse=False):
    
    plt.rcParams.update({'font.size': 16})
    
    X_data = data[data.columns[-1]].values
    y_data = data[data.columns[0]].values
    
    model.eval()
    preds = []
    for value in X_data:
        pred = model.predict([value])
        preds.append(pred)
        
    fig = plt.figure(figsize=(12, 8))
    ax = fig.add_subplot(1, 1, 1)
    ax.plot(y_data, y_data, linestyle='--', color='red')
    ax.scatter(y_data, preds, color='blue', s=2)
    ax.set_title('Regression plot')
    ax.set(xlabel='True values', ylabel='Predicted values')
    
    textstr = 'R2=%.2f\nMAE=%.2f\nMSE=%.2f'%(round(r2_score(y_data, preds), 2), round(mean_absolute_error(y_data, preds), 2), round(mean_squared_error(y_data, preds), 2))
    probs = dict(boxstyle='round', facecolor='wheat', alpha=0.5)
    
    if r2:
        ax.text(0.05, 0.95, textstr, transform=ax.transAxes, fontsize=14, verticalalignment='top', bbox=probs)
    
    fig.tight_layout()
    
    return fig