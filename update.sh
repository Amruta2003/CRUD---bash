#!/bin/bash 

getById(){
    searchData=$1
    echo "------------------------------------"
    echo "EId      Name      Gender     Salary"
    cat emp.txt | grep "$searchData " 
    echo "------------------------------------"
    return $searchData
}

updateByName(){
     searchData=$1
    oldData=`cat emp.txt| grep "$searchData "  | cut -d " " -f 3`
    echo "Present Name is : $oldData"
    read -p "Enter New Name of Employee: " newData      
    sed -i "s/$oldData/$newData/" emp.txt
    if [ $? -eq 0 ]
        then
            echo "Name Updated !!!"   
                 
    fi
 }   
    
    
    
updateData(){
    read -p "Enter the id which you want to edit: " uid
    getById $uid
    echo "You can only edit Name"

PS3="Please Enter Your Choice:"
Options=("Name" "Exit")

select option in "${Options[@]}"     
    do
        case $option in
    
            "Name")
                updateByName $uid
                ;;
            "Exit")
                break 
                ;;
            *) echo "Invalid Option";;
        esac
    done
   
    }
    
updateData 
