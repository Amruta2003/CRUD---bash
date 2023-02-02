#!/bin/bash 

#To add data i.e CREATE ADDITIONAL                 (C)
addData(){
    
    read -p "Enter Emp ID: " emp_id
    read -p "Enter Emp Name: " emp_name
    read -p "Enter Emp Gender: " emp_gender
    read -p "Enter Emp Salary: " emp_salary         
    cat emp.txt| cut -d " " -f 1 | grep -q $emp_id                                                                                                                                                                                                                                                                             
    if [ $? -eq 0 ]
         then
           echo "Id Already present Try another id "
    else
     echo "$emp_id ---- $emp_name ---- $emp_gender ---- $emp_salary" >> emp.txt
     echo "Inserted !!!"           
    fi   
} 


#To get all data i.e READ DATA                     (R)
getAllData(){
   echo "------------------------------------"
    echo "EId      Name      Gender     Salary"
    cat emp.txt 
   echo "------------------------------------"
    
} 


#Update data   i.e UPDATE                         (U)
updateData(){
    source update.sh
    }
    
    
#To delete particular data  i.e DELETE            (D)
deleteData(){
    read -p "Data to Delete of Employee: " dataToDelete
    grep -v "$dataToDelete " emp.txt > tmpfile && mv tmpfile emp.txt          
     if [ $? -eq 0 ]
        then
            echo "Deleted !!!"        
    fi
}

#To exit from options
doExit(){
     echo "Exiting with status 0....."
     exit 0
 }    
 
 #Executing the main part
 
 PS3="Please Enter Menu Choice: "
Options=("Add Employee" "Edit Employee" "Delete Employee" "Show Employee Data" "Exit")
select option in "${Options[@]}"     
    do
        case $option in
            "Add Employee")
                while true; 
                    do
                        addData
                        read -p "Do you wish to Add more?" yn
                    case $yn in
                        [Yy]* )  addData ;;
                        [Nn]* ) break;;
                        *) echo "Please answer yes or no.";;
                    esac
                done
                ;;
            "Show Employee Data")
                getAllData
                ;;
            "Edit Employee")
                
                 while true; 
                    do
                        updateData
                        read -p "Do you wish to Edit more?" yn
                    case $yn in
                        [Yy]* )  updateData ;;
                        [Nn]* ) break;;
                        *) echo "Please answer yes or no.";;
                    esac
                done
                ;;
            "Delete Employee")
                
                 while true; 
                    do
                        deleteData
                        read -p "Do you wish to Delete more?" yn
                    case $yn in
                        [Yy]* )  deleteData ;;
                        [Nn]* ) break;;
                        *) echo "Please answer yes or no.";;
                    esac
                done
                ;;
            
            "Exit")
                doExit 
                ;;
            *) echo "Invalid Option ";;
        esac
    done
