function [data]=abstract(a)
file_path=a;
img_path_list = dir(strcat(file_path,'*.jpg'));%获取该文件夹中所有jpg格式的图像  
img_num = length(img_path_list);%获取图像总数量
data=zeros(80,6);
if img_num > 0 %有满足条件的图像  
        for j = 1:img_num %逐一读取图像  
            image_name = img_path_list(j).name;% 图像名  
            image =  imread(strcat(file_path,image_name));  
            fprintf('%d %d %s\n',i,j,strcat(file_path,image_name));% 显示正在处理的图像名             
            [s1,s2,s3,s4,s5,s6]=extraction(image);
            data(j,:)=[s1 s2 s3 s4 s5 s6];
        end        
end


