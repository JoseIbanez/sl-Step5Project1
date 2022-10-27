#!/bin/bash

aws sesv2 create-email-identity --email-identity $SENDER_MAIL
aws sesv2 create-email-identity --email-identity $SENDER_MAIL_2
