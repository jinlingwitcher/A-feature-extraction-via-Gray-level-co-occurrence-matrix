function [data]=abstract(a)
file_path=a;
img_path_list = dir(strcat(file_path,'*.jpg'));%��ȡ���ļ���������jpg��ʽ��ͼ��  
img_num = length(img_path_list);%��ȡͼ��������
data=zeros(80,6);
if img_num > 0 %������������ͼ��  
        for j = 1:img_num %��һ��ȡͼ��  
            image_name = img_path_list(j).name;% ͼ����  
            image =  imread(strcat(file_path,image_name));  
            fprintf('%d %d %s\n',i,j,strcat(file_path,image_name));% ��ʾ���ڴ����ͼ����             
            [s1,s2,s3,s4,s5,s6]=extraction(image);
            data(j,:)=[s1 s2 s3 s4 s5 s6];
        end        
end


