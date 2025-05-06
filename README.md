
# 🌿 Anatolie Jentimir | Portfolio

> 👨‍💻 *“Driven by curiosity, built with code.”*

Welcome to my interactive and responsive portfolio — built with Django, styled to reflect passion, precision, and professionalism. This site showcases the journey, skills, and creations of a Computer Science student aiming to make a mark in Embedded Systems and Software Engineering.

---

## 🚀 Live Preview

**Localhost**: [http://127.0.0.1:8000](http://127.0.0.1:8000)  
**GitHub Pages (code only)**: [github.com/jentimanatol](https://github.com/jentimanatol?tab=repositories)

---

## 🧠 About Me

I'm a Computer Science student at **Bunker Hill Community College**, currently pursuing both AA in CS and AS in IT. My core passion lies in **Embedded Systems**, **Android Development**, and **Software Design**.

---

## 🎨 Features

- ✅ Fully responsive design
- ⚙️ Built with Django and Python 3.11+
- 💼 Highlights real projects with descriptions and technologies
- 📸 Dynamic image rendering using Django static files
- 📄 Resume-style content dynamically templated
- 🧭 Simple navigation (Home, Projects, Contact)
- 📦 Ready for packaging as `.exe` via PyInstaller

---

## 🛠️ Tech Stack

| Category       | Tools & Languages                                   |
|----------------|-----------------------------------------------------|
| 💻 Languages    | Java, Kotlin, Python, C/C++, Assembly               |
| 🧱 Frameworks   | Django, Android SDK                                 |
| 🧪 Databases    | MySQL, SQLite (local dev)                           |
| 🔧 Tools        | Git, Linux, VS Code, IntelliJ, Android Studio       |
| ⚙️ OS/Hardware | Embedded Linux, Raspberry Pi                         |

---

## 🖼️ Hero Image Preview

![Hero](portfolio/static/portfolio/images/hero.jpg)

> A custom cyberpunk-style developer image crafted for a futuristic personal branding touch.

---

## 📂 Project Structure

```
portfolio/
│
├── portfolio/             # Django app (views, urls, templates)
│   ├── static/            # Static assets (CSS, images, .js)
│   ├── templates/         # HTML templates
│   ├── views.py           # Core views
│   └── urls.py            # URL patterns
│
├── manage.py              # Django project entry point
├── db.sqlite3             # Local database
└── BambooCO2Offset.exe    # Optional PyInstaller-generated .exe
```

---

## 🧪 Run Locally

```bash
# Clone the repository
git clone https://github.com/jentimanatol/YourRepoName.git

# Navigate to the project
cd YourRepoName

# Create virtual environment (optional but recommended)
python -m venv venv
source venv/bin/activate  # On Windows use: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Run Django development server
python manage.py runserver
```

Visit [http://127.0.0.1:8000](http://127.0.0.1:8000) in your browser.

---

## 📦 Create .EXE File (Optional)

```bash
pip install pyinstaller
pyinstaller --noconsole --onefile manage.py
```

Find the `.exe` in the `/dist` folder. You can distribute this or upload it as a GitHub Release.

---

## 📧 Contact

- GitHub: [@jentimanatol](https://github.com/jentimanatol)
- Email: *(add if public)*
- Languages: English 🇬🇧 | Romanian 🇷🇴

---

## 🛰️ Inspired By

- NASA MINDS 2024
- STEAM Innovation Program
- Open-source contributions and robotics challenges

---

## 📜 License

This project is open-sourced for educational and personal showcase purposes. For other use cases, please contact the author.

---

*Built with love, Python, and a passion for building better systems.* ✨
