import requests
import tqdm 
import os 

def fileAlreadyExists(request, file_name, data_dir):
	total_file_size     = int(request.headers.get('content-length', 0))
	if os.path.exists(os.path.join(data_dir, file_name)):
		local_filename_size = os.path.getsize(os.path.join(data_dir, file_name))
		alreadyDownloaded   = True if total_file_size==local_filename_size else False
	else:
		alreadyDownloaded = False
	return alreadyDownloaded


def write_file_chunks(request, file_name, data_dir):
	total_file_size     = int(request.headers.get('content-length', 0))
	with open(os.path.join(data_dir, file_name), 'wb') as f:
		# for chunk in request.iter_content(chunk_size=1024): 
		for chunk in tqdm.tqdm(request.iter_content(chunk_size =1024000), total=total_file_size, unit='B', unit_scale=True):
			if chunk: # filter out keep-alive new chunks
				f.write(chunk)


def downloadFile(request, file_name):
	if fileAlreadyExists(request, file_name, data_dir):
		print ("File {} already downloaded.".format(file_name))
	else:
		print ("Start downloading file: {}".format(file_name))
		write_file_chunks(request, file_name, data_dir)
		print ("Downloaded file: {}".format(file_name))


def downloadAllFiles():
	for taxi_color in ['green', 'yellow']:
		for year in range(2016, 2008, -1):
			for month in range(1, 13):
				dataset_url = 'https://s3.amazonaws.com/nyc-tlc/trip+data/{}_tripdata_{}-{}.csv'.format(taxi_color, year, str(month).zfill(2))
				file_name   = dataset_url.split('/')[-1]
				request = requests.get(dataset_url, stream=True)
				downloadFile(request, file_name)




if __name__ == '__main__':
	# dataset_url = 'https://s3.amazonaws.com/nyc-tlc/trip+data/green_tripdata_2016-04.csv'
	# file_name   = dataset_url.split('/')[-1]
	data_dir    = r"F:\NYC_taxi_dataset"
	# r = requests.get(dataset_url, stream=True)
	# downloadFile(file_name)
	downloadAllFiles()
