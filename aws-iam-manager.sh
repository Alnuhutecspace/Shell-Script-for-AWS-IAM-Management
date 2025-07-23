#!/bin/bash

# AWS IAM Manager Script for CloudOps Solutions
# This script automates the creation of IAM users, groups, and permissions.

# --- Configuration ---
IAM_USER_NAMES=("john.doe" "jane.smith" "ade.olu" "godwin.chukwu" "mark.jack") 
ADMIN_GROUP_NAME="admin"
ADMIN_POLICY_ARN="arn:aws:iam::aws:policy/AdministratorAccess"

# --- Functions ---
create_iam_users() {
    echo "Starting IAM user creation process..."
    echo "-------------------------------------"
    for USER_NAME in "${IAM_USER_NAMES[@]}"; do
        echo "Attempting to create IAM user: $USER_NAME"
        aws iam get-user --user-name "$USER_NAME" >/dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo "Info: User '$USER_NAME' already exists. Skipping creation."
        else
            aws iam create-user --user-name "$USER_NAME"
            if [ $? -eq 0 ]; then
                echo "Success: User '$USER_NAME' created."
            else
                echo "Error: Failed to create user '$USER_NAME'."
            fi
        fi
        echo ""
    done
    echo "------------------------------------"
    echo "IAM user creation process completed."
    echo ""
}

create_admin_group() {
    echo "Creating admin group and attaching policy..."
    echo "--------------------------------------------"
    aws iam get-group --group-name "$ADMIN_GROUP_NAME" >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "Info: Group '$ADMIN_GROUP_NAME' already exists. Skipping creation."
    else
        echo "Creating group: $ADMIN_GROUP_NAME"
        aws iam create-group --group-name "$ADMIN_GROUP_NAME"
        if [ $? -eq 0 ]; then
            echo "Success: Group '$ADMIN_GROUP_NAME' created."
        else
            echo "Error: Failed to create group '$ADMIN_GROUP_NAME'."
            return 1
        fi
    fi

    echo "Attaching AdministratorAccess policy to '$ADMIN_GROUP_NAME'..."
    aws iam attach-group-policy --group-name "$ADMIN_GROUP_NAME" --policy-arn "$ADMIN_POLICY_ARN"
    if [ $? -eq 0 ]; then
        echo "Success: Policy attached."
    else
        echo "Error: Failed to attach policy. It might already be attached."
    fi
    echo ""
}

add_users_to_admin_group() {
    echo "Adding users to admin group '$ADMIN_GROUP_NAME'..."
    echo "----------------------------------------"
    for USER_NAME in "${IAM_USER_NAMES[@]}"; do
        echo "Adding user '$USER_NAME' to group '$ADMIN_GROUP_NAME'..."
        aws iam add-user-to-group --user-name "$USER_NAME" --group-name "$ADMIN_GROUP_NAME"
        if [ $? -eq 0 ]; then
            echo "Success: '$USER_NAME' added to '$ADMIN_GROUP_NAME'."
        else
            echo "Error: Failed to add '$USER_NAME'."
        fi
        echo ""
    done
    echo "----------------------------------------"
    echo "User group assignment completed."
    echo ""
}

main() {
    echo "=================================="
    echo " AWS IAM Management Script"
    echo "=================================="
    echo ""

    if ! command -v aws &> /dev/null; then
        echo "Error: AWS CLI is not installed."
        exit 1
    fi

    create_iam_users
    create_admin_group && add_users_to_admin_group

    echo "=================================="
    echo " AWS IAM Management Completed"
    echo "=================================="
}

main
exit 0

