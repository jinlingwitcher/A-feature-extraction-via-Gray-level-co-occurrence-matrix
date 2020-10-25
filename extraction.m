function [s1,s2,s3,s4,s5,s6]=extraction(x)
HSV=rgb2hsv(x);
Hgray=rgb2gray(HSV);
glcms1=graycomatrix(Hgray,'numlevels',64,'offset',[0 1;-1,1;-1 0;-1 -1]);
stats=graycoprops(glcms1,{'contrast','correlation','energy','homogeneity'});
ga1=glcms1(:,:,1);
ga2=glcms1(:,:,2);
ga3=glcms1(:,:,3);
ga4=glcms1(:,:,4);
energya1=0;energya2=0;energya3=0;energya4=0;
for i=1:64
      for j=1:64
        energya1=energya1+sum(ga1(i,j)^2);
        energya2=energya2+sum(ga2(i,j)^2);
        energya3=energya3+sum(ga3(i,j)^2);
        energya4=energya4+sum(ga4(i,j)^2);
        j=j+1;
      end
      i=i+1;
end
otherness1=0;otherness2=0;otherness3=0;otherness4=0;
for i=1:64
      for j=1:64
        otherness1=otherness1+sum(ga1(i,j)*abs(i-j));
        otherness2=otherness2+sum(ga2(i,j)*abs(i-j));
        otherness3=otherness3+sum(ga3(i,j)*abs(i-j));
        otherness4=otherness4+sum(ga4(i,j)*abs(i-j));
        j=j+1;
      end
      i=i+1;
end
s1=0;s2=0;s3=0;s4=0;s5=0;s6=0;
for m=1:4
      s1=stats.Contrast(1,m)+s1;
      m=m+1;
end
for m=1:4
      s2=stats.Correlation(1,m)+s2;
      m=m+1;
end
for m=1:4
      s3=stats.Energy(1,m)+s3;
      m=m+1;
end
for m=1:4
      s4=stats.Homogeneity(1,m)+s4;
      m=m+1;
end
s5=0.000001*(energya1+energya2+energya3+energya4);
s6=0.000001*(otherness1+otherness2+otherness3+otherness4);