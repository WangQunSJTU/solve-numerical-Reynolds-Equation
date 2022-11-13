classdef node < handle
    properties (GetAccess = public, SetAccess = public)
        startPoint
    end

    properties (GetAccess = public, SetAccess = public)
        endPoint
    end

    properties (GetAccess = public, SetAccess = public)
        next=node.empty
    end 

    properties (GetAccess = public, SetAccess = public)
        prior=node.empty
    end
    
    methods
        function obj = node(inputArg1,inputArg2)
            obj.startPoint = inputArg1 ;
            obj.endPoint= inputArg2;
        end
    end
end

