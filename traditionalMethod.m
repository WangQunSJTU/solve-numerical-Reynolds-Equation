function [pressure] = traditionalMethod (A,B,C,initPressure,rate,theta,showPicture)
oldPressure=initPressure;
newPressure=zeros(length(A),1);

t=0;
while(true)
t=t+1;
  for i=2:length(A)-1
      %Successive Over Relaxation
      newPressure(i)=rate*(A(i)*newPressure(i-1)+B(i)*newPressure(i+1)-C(i))/(A(i)+B(i))+(1-rate)*newPressure(i);
      if(newPressure(i)<0)
          newPressure(i)=0;
      end
  end

  allDelta=0;
  for i=2:length(A)-1
      delta=abs(oldPressure(i)-newPressure(i))/(abs(oldPressure(i))+eps);
      allDelta=allDelta+delta;
  end
  allDelta=allDelta/length(A);
  if(allDelta<theta)
      break
  end
  oldPressure=newPressure;
  if showPicture==1 && mod(t,500)==0
      plot(oldPressure,'--');
      hold on
  end
end
pressure=newPressure;
end