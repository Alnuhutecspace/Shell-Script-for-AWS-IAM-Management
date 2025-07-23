# Shell-Script-for-AWS-IAM-Management 

## Project Scenerio
CloudOps Solution is a growing company that recently adopted AWS to manage its cloud infrastructure. As the company scales, they have decided to automate the process of managing AWS Identity and Access Management (IAM) resources. This includes the creation of users, user groups, and the assignment of permissions for new hires, especially for their DevOps team. 

## Purpose 

Extending shell scripting capabilities by creating more functions inside the "aws-iam-management" script to fulfill the objectives below. Ensure that you have already configured AWS CLI in you terminal and the configured AWS Account have the appropriate permissions to manage IAM resources. 

## Project Objective 

Extend the provided script to include IAM management by:

1. Defining IAM User Names Array to store the names of five IAM users in an array for easy iteration during user creation.

2. Create the IAM Users as you iterate through the array using AWS CLI commands.

3. Define and call a function to create an IAM group name 'admin' using the AWS CLI commands.

4. Attach an AWS-managed administrative policy (e.g., "AdministratorAccess") to the 'admin' group to grant administrative privileges.

5. Iterate through the array of IAM user name and assign each user to the 'admin' group using AWS CLI commands. 

## Confirmation of AWS CLI Installation, Creating File and Write the Code 

![Confirmation of AWS and Creation of File](./Img/01.%20Confirmation%20of%20AWS%20CLI%20and%20File%20Creation.png) 

## AWS-IAM-Manager.sh 

![AWS Shell Script](./Img/02.%20AWS%20Shell%20Script.png)

![AWS Shell Script Cont.](./Img/03.%20AWS%20Shell%20Script%20Cont.png) 

![AWS Shell Script Cont.](./Img/04.%20AWS%20Shell%20Script%20Cont..png) 

![AWS Shell Script Cont.](./Img/05.%20AWS%20Shell%20Script%20Cont.png) 

![AWS Shell Script Cont.](./Img/06.%20AWS%20Shell%20Script%20Cont..png)

## Making AWS-IAM-Manager.sh Shell Script Executable 

![Command to Execute](./Img/07.%20Command%20to%20Execute%20Script.png) 

![Script Executed Cont.](./Img/08.%20Script%20Executed.png)

![Script Executed Cont.](./Img/09.%20Script.Executed%20Cont.png) 

![Script Executed Cont.](./Img/10.%20Script%20Executed%20Cont..png) 

![Script Executed Cont.](./Img/11.%20Script%20Executed%20Cont..png) 

![Script Executed Cont.](./Img/11.%20Script%20Executed%20Cont..png) 

![Script Executed Cont.](./Img/12.%20Script%20Executed%20Cont..png) 

## Five Users Created Using AWS CLI Command  

![Five Users Created Using AWS CLI](./Img/13.%20Five%20Users%20Created%20Using%20AWS%20CLI.png) 

![Five Users Created Using AWS CLI](./Img/14.%20Five%20Users%20Created%20Using%20AWS%20CLI%20Cont..png) 

## User Group "admin" Created With AWS CLI

![User Group Created Using AWS CLI](./Img/15.%20User%20Group%20Created%20Using%20AWS%20CLI.png) 

## Assigned the AWS Managed AdministratorAccess Policy to the admin Group to Provide Full Administrative Privileges.

![Policy Attached to User Group](./Img/16.%20Policy%20Attached%20to%20User%20Group.png) 

## Each IAM User was Assigned to the "admin" Group 

![User Assign to Group](./Img/17.%20User%20Assign%20to%20Group.png) 

![User Assign to Group Cont](./Img/18.%20User%20Assign%20to%20Group%20Cont..png)

## AWS IAM Manager Script Documentation

## Objective

Automate the creation of IAM users, an administrative group, attach administrative policies, and assign users to the group using AWS CLI.

## Script Components

## 1. `IAM_USER_NAMES` Array

Stores a list of usernames to be created and managed.

```bash
IAM_USER_NAMES=("alice" "bob" "charlie")
```

## 2. `create_iam_users` Function

- Loops through the list of users.

- Creates each IAM user using `aws iam create-user`.

- Handles error messages if the user already exists.

## 3. `create_admin_group` Function

- Checks if an "admin" group exists.

- If not, it creates the group.

- Attaches the built-in `AdministratorAccess` policy.

## 4. `add_users_to_admin_group` Function

- Iterates over the IAM users.

- Adds them to the "admin" group using `aws iam add-user-to-group`.

## 5. `main` Function

- Verifies the AWS CLI is available.

- Calls all the setup functions in sequence.

## Prerequisites

- AWS CLI must be installed and configured with the proper IAM permissions.

- Script must be executed by a user with permission to manage IAM resources.

## Error Handling & Logging

- The script checks the return status of every AWS CLI command (`$?`).

- Output logs provide visibility into each operation and its success/failure.

## Security Note

Avoid hardcoding sensitive credentials. Rely on AWS CLI config or environment variables instead.

## Future Enhancements

- Add logging to a file.

- Include MFA configuration.

- Integrate with AWS Secrets Manager.

## Deliverable 2: Script Link

You can upload the script to a version control repository like GitHub and share the link. Example README repo structure:

```
aws-iam-manager/
├── aws_iam_manager.sh
└── README.md (with the above documentation)
```
