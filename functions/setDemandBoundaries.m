function model = setDemandBoundaries(model,switchInput)



switch switchInput
    
        case 1
        
        model   = changeRxnBounds(model,'DM_C90pPHA',0,'l')        ;  
        model   = changeRxnBounds(model,'DM_C90pPHA',0,'u')        ; 

        model   = changeRxnBounds(model,'DM_C90aPHA',0,'l')        ;  
        model   = changeRxnBounds(model,'DM_C90aPHA',0,'u')        ;  

        model   = changeRxnBounds(model,'DM_C80pPHA',0,'l')        ;   
        model   = changeRxnBounds(model,'DM_C80pPHA',0,'u')        ;  

        model   = changeRxnBounds(model,'DM_C70pPHA',0,'l')        ;  
        model   = changeRxnBounds(model,'DM_C70pPHA',0,'u')        ;  

        model   = changeRxnBounds(model,'DM_C70aPHA',0,'l')        ;   
        model   = changeRxnBounds(model,'DM_C70aPHA',0,'u')        ;  

        model   = changeRxnBounds(model,'DM_C60pPHA',0,'l')        ;  
        model   = changeRxnBounds(model,'DM_C60pPHA',0,'u')        ;  

        model   = changeRxnBounds(model,'DM_C60atPHA',0,'l')        ;   
        model   = changeRxnBounds(model,'DM_C60atPHA',0,'u')        ;  
        
        model   = changeRxnBounds(model,'DM_C80aPHA',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C80aPHA',1000,'u')        ; 

        model   = changeRxnBounds(model,'DM_C60aPHA',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C60aPHA',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C50pPHA',0,'l')        ;   
        model   = changeRxnBounds(model,'DM_C50pPHA',0,'u')        ;  


        model   = changeRxnBounds(model,'DM_C50aPHA',0,'l')        ;   
        model   = changeRxnBounds(model,'DM_C50aPHA',0,'u')        ;  

        model   = changeRxnBounds(model,'DM_C40pPHA',0,'l')        ;   
        model   = changeRxnBounds(model,'DM_C40pPHA',0,'u')        ;  

        model   = changeRxnBounds(model,'DM_C40atPHA',0,'l')        ;   
        model   = changeRxnBounds(model,'DM_C40atPHA',0,'u')        ;  

        model   = changeRxnBounds(model,'DM_C40aPHA',0,'l')        ;   
        model   = changeRxnBounds(model,'DM_C40aPHA',0,'u')        ;  

        model   = changeRxnBounds(model,'DM_C142PHA',0,'l')        ;   
        model   = changeRxnBounds(model,'DM_C142PHA',0,'u')        ;  


        model   = changeRxnBounds(model,'DM_C141d5PHA',0,'l')        ;   
        model   = changeRxnBounds(model,'DM_C141d5PHA',0,'u')        ; 

        model   = changeRxnBounds(model,'DM_C141aPHA',0,'l')        ;   
        model   = changeRxnBounds(model,'DM_C141aPHA',0,'u')        ;  

        model   = changeRxnBounds(model,'DM_C140aPHA',0,'l')        ;   
        model   = changeRxnBounds(model,'DM_C140aPHA',0,'u')        ;  

        model   = changeRxnBounds(model,'DM_C121d6PHA',0,'l')        ;   
        model   = changeRxnBounds(model,'DM_C121d6PHA',0,'u')        ;  

        model   = changeRxnBounds(model,'DM_C121aPHA',0,'l')        ;   
        model   = changeRxnBounds(model,'DM_C121aPHA',0,'u')        ;  


        model   = changeRxnBounds(model,'DM_C120aPHA',0,'l')        ;   
        model   = changeRxnBounds(model,'DM_C120aPHA',0,'u')        ; 

        model   = changeRxnBounds(model,'DM_C101PHA',0,'l')        ;   
        model   = changeRxnBounds(model,'DM_C101PHA',0,'u')        ;  

        model   = changeRxnBounds(model,'DM_C100pPHA',0,'l')        ;   
        model   = changeRxnBounds(model,'DM_C100pPHA',0,'u')        ;  

        model   = changeRxnBounds(model,'DM_C100aPHA',0,'l')        ;   
        model   = changeRxnBounds(model,'DM_C100aPHA',0,'u')        ;  
 
            case 2
             
         model   = changeRxnBounds(model,'DM_C90pPHA',-1000,'l')        ;  
        model   = changeRxnBounds(model,'DM_C90pPHA',1000,'u')        ; 

        model   = changeRxnBounds(model,'DM_C90aPHA',-1000,'l')        ;  
        model   = changeRxnBounds(model,'DM_C90aPHA',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C80pPHA',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C80pPHA',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C70pPHA',-1000,'l')        ;  
        model   = changeRxnBounds(model,'DM_C70pPHA',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C70aPHA',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C70aPHA',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C60pPHA',-1000,'l')        ;  
        model   = changeRxnBounds(model,'DM_C60pPHA',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C60atPHA',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C60atPHA',1000,'u')        ;  
        
        model   = changeRxnBounds(model,'DM_C80aPHA',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C80aPHA',1000,'u')        ; 

        model   = changeRxnBounds(model,'DM_C60aPHA',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C60aPHA',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C50pPHA',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C50pPHA',1000,'u')        ;  


        model   = changeRxnBounds(model,'DM_C50aPHA',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C50aPHA',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C40pPHA',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C40pPHA',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C40atPHA',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C40atPHA',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C40aPHA',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C40aPHA',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C142PHA',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C142PHA',1000,'u')        ;  


        model   = changeRxnBounds(model,'DM_C141d5PHA',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C141d5PHA',1000,'u')        ; 

        model   = changeRxnBounds(model,'DM_C141aPHA',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C141aPHA',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C140aPHA',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C140aPHA',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C121d6PHA',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C121d6PHA',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C121aPHA',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C121aPHA',1000,'u')        ;  


        model   = changeRxnBounds(model,'DM_C120aPHA',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C120aPHA',1000,'u')        ; 

        model   = changeRxnBounds(model,'DM_C101PHA',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C101PHA',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C100pPHA',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C100pPHA',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C100aPHA',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C100aPHA',1000,'u')        ;  

         case 3
        
 model   = changeRxnBounds(model,'DM_C90pPHA_c',0,'l')        ;  
 model   = changeRxnBounds(model,'DM_C90pPHA_c',0,'u')        ; 
 
 model   = changeRxnBounds(model,'DM_C90aPHA_c',0,'l')        ;  
 model   = changeRxnBounds(model,'DM_C90aPHA_c',0,'u')        ;  
 
 model   = changeRxnBounds(model,'DM_C80pPHA_c',0,'l')        ;   
 model   = changeRxnBounds(model,'DM_C80pPHA_c',0,'u')        ;  
 
 model   = changeRxnBounds(model,'DM_C70pPHA_c',0,'l')        ;  
 model   = changeRxnBounds(model,'DM_C70pPHA_c',0,'u')        ;  
 
 model   = changeRxnBounds(model,'DM_C70aPHA_c',0,'l')        ;   
 model   = changeRxnBounds(model,'DM_C70aPHA_c',0,'u')        ;  
 
 model   = changeRxnBounds(model,'DM_C60pPHA_c',0,'l')        ;  
 model   = changeRxnBounds(model,'DM_C60pPHA_c',0,'u')        ;  

 model   = changeRxnBounds(model,'DM_C60atPHA_c',0,'l')        ;   
 model   = changeRxnBounds(model,'DM_C60atPHA_c',0,'u')        ;  
 
 model   = changeRxnBounds(model,'DM_C80aPHA_c',-1000,'l')        ;   
 model   = changeRxnBounds(model,'DM_C80aPHA_c',1000,'u')        ; 

 model   = changeRxnBounds(model,'DM_C60aPHA_c',-1000,'l')        ;   
 model   = changeRxnBounds(model,'DM_C60aPHA_c',1000,'u')        ;  

 model   = changeRxnBounds(model,'DM_C50pPHA_c',0,'l')        ;   
 model   = changeRxnBounds(model,'DM_C50pPHA_c',0,'u')        ;  


 model   = changeRxnBounds(model,'DM_C50aPHA_c',0,'l')        ;   
 model   = changeRxnBounds(model,'DM_C50aPHA_c',0,'u')        ;  

 model   = changeRxnBounds(model,'DM_C40pPHA_c',0,'l')        ;   
 model   = changeRxnBounds(model,'DM_C40pPHA_c',0,'u')        ;  

 model   = changeRxnBounds(model,'DM_C40atPHA_c',0,'l')        ;   
 model   = changeRxnBounds(model,'DM_C40atPHA_c',0,'u')        ;  

 model   = changeRxnBounds(model,'DM_C40aPHA_c',0,'l')        ;   
 model   = changeRxnBounds(model,'DM_C40aPHA_c',0,'u')        ;  

 model   = changeRxnBounds(model,'DM_C142PHA_c',0,'l')        ;   
 model   = changeRxnBounds(model,'DM_C142PHA_c',0,'u')        ;  


 model   = changeRxnBounds(model,'DM_C141d5PHA_c',0,'l')        ;   
 model   = changeRxnBounds(model,'DM_C141d5PHA_c',0,'u')        ; 

 model   = changeRxnBounds(model,'DM_C141aPHA_c',0,'l')        ;   
 model   = changeRxnBounds(model,'DM_C141aPHA_c',0,'u')        ;  
 
 model   = changeRxnBounds(model,'DM_C140aPHA_c',0,'l')        ;   
 model   = changeRxnBounds(model,'DM_C140aPHA_c',0,'u')        ;  

 model   = changeRxnBounds(model,'DM_C121d6PHA_c',0,'l')        ;   
 model   = changeRxnBounds(model,'DM_C121d6PHA_c',0,'u')        ;  

 model   = changeRxnBounds(model,'DM_C121aPHA_c',0,'l')        ;   
 model   = changeRxnBounds(model,'DM_C121aPHA_c',0,'u')        ;  


 model   = changeRxnBounds(model,'DM_C120aPHA_c',0,'l')        ;   
 model   = changeRxnBounds(model,'DM_C120aPHA_c',0,'u')        ; 

 model   = changeRxnBounds(model,'DM_C101PAH_c',0,'l')        ;   
 model   = changeRxnBounds(model,'DM_C101PAH_c',0,'u')        ;  

 model   = changeRxnBounds(model,'DM_C100pPHA_c',0,'l')        ;   
 model   = changeRxnBounds(model,'DM_C100pPHA_c',0,'u')        ;  

 model   = changeRxnBounds(model,'DM_C100aPHA_c',0,'l')        ;   
 model   = changeRxnBounds(model,'DM_C100aPHA_c',0,'l')        ;   
 model   = changeRxnBounds(model,'DM_C100aPHA_c',0,'u')        ;  
 
            case 4
             
         model   = changeRxnBounds(model,'DM_C90pPHA_c',-1000,'l')        ;  
        model   = changeRxnBounds(model,'DM_C90pPHA_c',1000,'u')        ; 

        model   = changeRxnBounds(model,'DM_C90aPHA_c',-1000,'l')        ;  
        model   = changeRxnBounds(model,'DM_C90aPHA_c',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C80pPHA_c',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C80pPHA_c',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C70pPHA_c',-1000,'l')        ;  
        model   = changeRxnBounds(model,'DM_C70pPHA_c',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C70aPHA_c',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C70aPHA_c',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C60pPHA_c',-1000,'l')        ;  
        model   = changeRxnBounds(model,'DM_C60pPHA_c',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C60atPHA_c',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C60atPHA_c',1000,'u')        ;  
        
        model   = changeRxnBounds(model,'DM_C80aPHA_c',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C80aPHA_c',1000,'u')        ; 

        model   = changeRxnBounds(model,'DM_C60aPHA_c',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C60aPHA_c',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C50pPHA_c',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C50pPHA_c',1000,'u')        ;  


        model   = changeRxnBounds(model,'DM_C50aPHA_c',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C50aPHA_c',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C40pPHA_c',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C40pPHA_c',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C40atPHA_c',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C40atPHA_c',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C40aPHA_c',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C40aPHA_c',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C142PHA_c',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C142PHA_c',1000,'u')        ;  


        model   = changeRxnBounds(model,'DM_C141d5PHA_c',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C141d5PHA_c',1000,'u')        ; 

        model   = changeRxnBounds(model,'DM_C141aPHA_c',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C141aPHA_c',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C140aPHA_c',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C140aPHA_c',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C121d6PHA_c',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C121d6PHA_c',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C121aPHA_c',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C121aPHA_c',1000,'u')        ;  


        model   = changeRxnBounds(model,'DM_C120aPHA_c',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C120aPHA_c',1000,'u')        ; 

        model   = changeRxnBounds(model,'DM_C101PAH_c',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C101PAH_c',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C100pPHA_c',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C100pPHA_c',1000,'u')        ;  

        model   = changeRxnBounds(model,'DM_C100aPHA_c',-1000,'l')        ;   
        model   = changeRxnBounds(model,'DM_C100aPHA_c',1000,'u')        ;  
        
end
