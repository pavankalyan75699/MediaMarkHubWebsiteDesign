# MediaMarkHub - Django Application Setup Guide

## Quick Start (Easiest Method)

### Option 1: Using the batch file
1. Double-click `run_server.bat` in this directory
2. The script will automatically:
   - Check if Python is installed
   - Install Django if needed
   - Run database migrations
   - Start the development server
3. Open your browser and go to: http://127.0.0.1:8000/

---

## Manual Setup (Step by Step)

### Step 1: Install Python
1. Download Python from https://www.python.org/downloads/
   - Choose the latest version (Python 3.x)
2. During installation, **check the box "Add Python to PATH"**
3. Click "Install Now"

### Step 2: Install Django
Open Command Prompt or PowerShell and run:
```bash
pip install django
```

Or use the requirements file:
```bash
pip install -r requirements.txt
```

### Step 3: Run Database Migrations
Navigate to your project folder and run:
```bash
cd "d:\danymediamarkhub\mediamarkhub1"
python manage.py migrate
```

### Step 4: Start the Server
```bash
python manage.py runserver
```

### Step 5: Access Your Website
Open your web browser and go to: **http://127.0.0.1:8000/**

---

## Troubleshooting

### If Python is not found:
1. Reinstall Python and make sure "Add Python to PATH" is checked
2. Restart your command prompt after installation

### If Django is not found:
```bash
python -m pip install --upgrade pip
pip install django
```

### If you get port 8000 already in use error:
```bash
python manage.py runserver 8080
```
Then access http://127.0.0.1:8080/

### If static files are not loading:
Run this command to collect static files:
```bash
python manage.py collectstatic
```

---

## What Your Application Includes

✅ Professional landing page for MediaMarkHub
✅ About Us section
✅ Services showcase (Graphic Design, Social Media, UI/Web Design)
✅ Team members section (Pavan Kalyan & Kiran Kumar)
✅ Contact information
✅ Responsive design optimized for all devices
✅ Modern CSS styling with smooth animations

---

## Project Structure
```
mediamarkhub1/
├── main/                    # Main Django app
│   ├── templates/           # HTML templates
│   │   └── media.html       # Main page
│   ├── static/              # Static files
│   │   ├── css/             # Stylesheets
│   │   └── img/             # Images
│   ├── views.py             # View functions
│   └── urls.py              # URL routing
├── mediamarkhub1/           # Project settings
│   └── settings.py          # Django configuration
└── manage.py                # Django management script
```

---

## Need Help?
If you encounter any issues, please ensure:
1. Python is installed and accessible via command line
2. Django is installed (check with: `python -c "import django"`)
3. You're running commands from the correct directory
4. Your firewall is not blocking the server

**Happy coding! 🚀**

