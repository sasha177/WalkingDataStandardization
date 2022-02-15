clear all

%Select the folder and files that I want to access
d = '/Users/sashamittal/Downloads/AB06/AB06/10_09_18/**/*.mat';
subFolders = dir(d);
dirData = dir(d);
dirData_filenames = fullfile(d, {dirData.name} );

%Initialize an array for the treadmill emg data set
my_data = []

function f = data_manipulation(experiment, datatype)
    %Iterate through the selected folder
    for i=1:size(dirData,1)
    
        %Select the folder that has treadmill emg data
        name = dirData(i).name;
        folder = dirData(i).folder;
        if contains(folder,convertCharsToStrings(experiment)) && contains(folder,convertCharsToStrings(datatype))
            data=load(strcat(folder,'/',name));
        
        %upsample or downsample here (a seperate function)
        
            %Vertically concatenate the data here
            my_data = [my_data;data.data];
        end
    
        %Verify the dataset size
        f=size(my_data);
    end
end

%tasks: add comments so you know whats going on, make this a function with
%arguments treadmill and emg (give me all of treadmill emg data), iterate
%over all the data 

%double for loop for 10_09 folder 
%column for experiment type, columns for each feature 

