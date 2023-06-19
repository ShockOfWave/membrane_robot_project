import torch
from torch.utils.data import Dataset
from sklearn.preprocessing import MinMaxScaler
import joblib
import pandas as pd

class CustomDataset(Dataset):
    def __init__(self, csv_file, scaler_file=None, savepath='scaler.pkl'):
        self.data = torch.tensor(pd.read_csv(csv_file).values, dtype=torch.float32)
        # self.scaler = MinMaxScaler()
        # self.scaler_file = scaler_file
        
        # if self.scaler_file:
        #     self.scaler = joblib.load(self.scaler_file)
        # else:
        #     self.data[:, 0] = torch.from_numpy(self.scaler.fit_transform(self.data[:, 0].reshape(-1, 1)).flatten())
        #     joblib.dump(self.scaler, savepath)
            
    def __len__(self):
        return len(self.data)
    
    def __getitem__(self, index):
        x = self.data[index, 0]
        y = self.data[index, 1]
        return x, y