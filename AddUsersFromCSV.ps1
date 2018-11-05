#import module
Import-Module ActiveDirectory

#prompt for CSV file
$filepath = Read-Host -Prompt "please enter path to CSV file you would like to use"

#store csv to variable
$users = Import-CSV $filepath

#loop through CSV and gather information
ForEach ($user in $users) {
    $fname = $user.'First Name'
    $lname = $user.'Last Name'
    $email = $user.email
    $jobTitle = $user.'Job Title'
    $phone = $user.phone
    $OUpath = $user.OU

    #create password for user and print it to screen
    $securePassword = ConvertTo-SecureString "$fname.$lname!estp@ssw0rd" -AsPlainText -Force
    echo "$fname.$lname!estp@ssw0rd"

    #create new AD user for each in CSV

    New-ADUser `
        -Name "$fname $lname" `
        -GivenName $fname `
        -Surname $lname `
        -UserPrincipalName "$("$fname.$lname")@testserver.com" `
        -OfficePhone $phone `
        -EmailAddress $email `
        -Path $OUpath `
        -AccountPassword $securePassword `
        -ChangePasswordAtLogon $True `
        -Enabled $True


}
