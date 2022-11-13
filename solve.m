function [pressure] = solve(A,B,C)
        l = length(A);
beginSentinelNode=node(0,0);
endSentinelNode=node(0,0);

        beginSentinelNode.next = endSentinelNode;
        endSentinelNode.prior = beginSentinelNode;
        currentNode = -1;

        c(1) = 0;
        m(1) = 1;
        n(1) = 0;
        c(2) = 0;
        m(2) = 0;
        n(2) = 1;


        for i = 3:l
            m(i) = (-A(i-1) * m(i - 2) + (A(i-1) + B(i-1)) * m(i - 1)) / B(i-1);
            n(i) = (-A(i-1) * n(i - 2) + (A(i-1) + B(i-1)) * n(i - 1)) / B(i-1);
            c(i) = (-A(i-1) * c(i - 2) + (A(i-1) + B(i-1)) * c(i - 1) + C(i-1)) / B(i-1);
        end


        for i = 2:l-1  
            if (currentNode ==-1) 
                if (C(i) > 0) 
                    continue;
                 else 
                    currentNode = node(0,0);
                    currentNode.startPoint = i - 1;
                    currentNode.endPoint = i + 1;
                    currentNode.next = endSentinelNode;
                    currentNode.prior=endSentinelNode.prior;
                    endSentinelNode.prior.next = currentNode;
                    endSentinelNode.prior = currentNode;
                    continue;
                end
            end

            if (C(i) < 0) 
                currentNode.endPoint = i + 1;
                continue;
            end
            currentNode = -1;
        end



        while (true) 
            pressure = getAllPressure(beginSentinelNode,endSentinelNode,m,n,c);
            hasChange =iteration(1,beginSentinelNode,endSentinelNode,m,n,c)||iteration(0,beginSentinelNode,endSentinelNode,m,n,c);
            if(hasChange==0)
                break;
            end
        end
        pressure = getAllPressure(beginSentinelNode,endSentinelNode,m,n,c);
end