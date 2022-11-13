function [hasChange] = iteration(isForwardDirection,beginSentinelNode,endSentinelNode,m,n,c)
        hasChange = 0;
        if (isForwardDirection) 
            currentNode = beginSentinelNode.next;
        else 
            currentNode = endSentinelNode.prior;
        end

        while (currentNode ~= beginSentinelNode && currentNode ~= endSentinelNode) 
            if (isForwardDirection) 
                startPoint = currentNode.startPoint;
                endPoint = currentNode.endPoint;
                while (endPoint <= length(m)) 
                    if (endPoint == length(m)) 
                        return ;
                    end
                    endPoint=endPoint+1;
                    p = solvePressure(startPoint, endPoint, endPoint - 1,m,n,c);
                    if (p > 0) 
                        hasChange = 1;
                        if (currentNode.next == endSentinelNode) 
                            currentNode.endPoint = endPoint;
                            continue;
                        end
                        if (currentNode.next.startPoint > endPoint - 1) 
                            currentNode.endPoint = endPoint;
                            continue;
                        end
                        endPoint = currentNode.next.endPoint;
                        currentNode.endPoint = endPoint;
                        nextNextNode = currentNode.next.next;
                        nextNextNode.prior = currentNode;
                        currentNode.next = nextNextNode;
                    else
                        break;
                    end
                end 
                currentNode=currentNode.next;
       
            else 
                startPoint = currentNode.startPoint;
                endPoint = currentNode.endPoint;
                while (startPoint >= 1) 
                    if (startPoint == 1) 
                        return;
                    end
                    startPoint=startPoint-1;
                    p = solvePressure(startPoint, endPoint, startPoint + 1,m,n,c);
                    if (p > 0) 
                        hasChange = 1;
                        if (currentNode.prior == beginSentinelNode) 
                            currentNode.startPoint = startPoint;
                            continue;
                        end
                        if (currentNode.prior.endPoint < startPoint + 1) 
                            currentNode.startPoint = startPoint;
                            continue;
                        end
                        startPoint = currentNode.prior.startPoint;
                        currentNode.startPoint = startPoint;
                        priorPriorNode = currentNode.prior.prior;
                        priorPriorNode.next = currentNode;
                        currentNode.prior = priorPriorNode;
                    else
                        break;
                    end
                end
                currentNode = currentNode.prior;
            end
        end
   
end