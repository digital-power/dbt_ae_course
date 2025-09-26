# dbt Setup Guide

This guide will walk you through setting up dbt on your local laptop. 

## Prerequisites

Before starting, ensure you have the following installed:
- Python (3.7 or higher)
- Git
- VS Code

## Step 1: Clone the Repository

1. **Clone the repository** to your laptop by running in your terminal :
   ```bash
   git clone https://github.com/digital-power/dbt_ae_course.git <desired_name>
   ```

2. **Navigate to the project directory**:
   ```bash
   cd <desired_name>
   ```

3. **Open the directory in VS Code**:
   ```bash
   code .
   ```
   > **Note:** We recommend using VS Code as your IDE. If you're using a different editor, the `code` command won't work as it's specific to VS Code (which means open with VS Code).

4. **Create your own branch** from the main branch:
   ```bash
   git checkout -b <your_name>
   ```

## Step 2: Create a Python Virtual Environment

### For Windows:
```bash
# Create virtual environment
python -m venv venv

# Activate virtual environment
venv/Scripts/Activate.ps1
```

### For Mac/Linux:
```bash
# Create virtual environment
python3 -m venv venv

# Activate virtual environment
source venv/bin/activate
```

### Install Dependencies
Once your virtual environment is activated, install the required dependencies:
```bash
pip install -r requirements.txt
```

## Step 3: Configure Authentication

Authentication is required to connect to the data platform. You'll need to set up your credentials in a `profiles.yml` file (which will be stored in a 'hidden' folder on your laptop outside the repo).

### Create and Configure profiles.yml

1. **Create the profiles.yml file** on your laptop:
   
   **For Windows:**
   ```bash
   code C:\Users\<your_username>\.dbt\profiles.yml
   ```
   
   **For Mac/Linux:**
   ```bash
   code ~/.dbt/profiles.yml
   ```

2. **Copy the context from template-file** `/profiles_dot_yml - template.txt` in the repository root into this file.

3. **Fill in the required fields** (marked with `<xxxxxx>` in the template):

### Generate Databricks Token

To get your authentication token:

1. Open Databricks and click on your name (top right corner)
2. Go to **Settings**
3. Navigate to **User** > **Developer** > **Access tokens** > **Manage**
4. Click **Generate new token**
5. Copy the generated token and paste it in your `profiles.yml` file
6. Don't forget to save the file

### Complete the Configuration

- **Token:** Use the token you just generated from Databricks
- **Developer Abbreviation:** Use your own name for the `<developer_abbreviation>` field. This will be the name of the schema where your tables will be created in Databricks.

> **Important:** Make sure that the profile name in `profiles.yml` matches the profile specified in the `dbt_project.yml` file (in this case dbt_ae_course).

## Step 4: Verify Your Setup

Test your connection by running:
```bash
dbt debug
```

If everything is configured correctly, all checks should turn green! 🎉

## Troubleshooting

If you encounter issues:
- Verify your virtual environment is activated
- Check that your `profiles.yml` file is in the correct location
- Ensure your Databricks token is valid
- Confirm the profile name matches between `profiles.yml` and `dbt_project.yml`

If you get the following SSL certificate error:
```
WARNING:urllib3.connectionpool:Retrying (DatabricksRetryPolicy(total=29, connect=None, read=None, redirect=None, status=None)) after connection broken by 'SSLError(SSLCertVerificationError(1, '[SSL: CERTIFICATE_VERIFY_FAILED] certificate verify failed: self-signed certificate in certificate chain (_ssl.c:1000)'))': /sql/1.0/warehouses/e35b822548150739
```

You need to install package `pip-system-certs` into your virtualenv by running `pip install pip-system-certs`


## Next Steps

Once your setup is verified, you're ready to start working with dbt! You can now run dbt commands like:
- `dbt run` - Execute your models
- `dbt test` - Run your tests
- `dbt docs generate` - Generate documentation

Happy modeling! 🚀