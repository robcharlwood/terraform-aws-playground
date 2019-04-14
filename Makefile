VENV ?= ./.aws-env
PYTHON_EXE ?= python3.7
PYTHON_OK := $(shell type -P ${PYTHON_EXE})
TERRAFORM_OK := $(shell type -P terraform)

check_terraform:
	@echo '*********** Checking for terraform installation **********'
    ifeq ('$(TERRAFORM_OK)','')
	    $(error package 'terraform' not found!)
    else
	    @echo Found terraform!
    endif

check_python:
	@echo '*********** Checking for Python installation ***********'
    ifeq ('$(PYTHON_OK)','')
	    $(error python interpreter: '${PYTHON_EXE}' not found!)
    else
	    @echo Found Python
    endif

setup_venv:
	@echo '****** Creating virtualenv and installing aws-cli ******'
	${PYTHON_EXE} -m venv ${VENV}
	${VENV}/bin/pip install --upgrade pip
	${VENV}/bin/pip install -r requirements.txt
	@echo '*************** Installation Complete ******************'

setup_terraform:
	@echo '************ Setting up terraform ***************'
	terraform init
	@echo '*************** Setup Complete ******************'

install: check_terraform check_python setup_venv setup_terraform

clean:
	rm -rf ./.terraform
	rm -rf ${VENV}
