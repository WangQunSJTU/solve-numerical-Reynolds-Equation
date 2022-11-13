function [pressure] = getAllPressure(beginSentinelNode,endSentinelNode,m,n,c)
pressure=zeros(length(m),1);
currentNode = beginSentinelNode.next;
while(currentNode~=endSentinelNode)
    for i=currentNode.startPoint+1:currentNode.endPoint-1
        pressure(i)=solvePressure(currentNode.startPoint, currentNode.endPoint,i,m,n,c);
    end
    currentNode=currentNode.next;
end
end