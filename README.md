# ��� Bash Task Scheduler
A lightweight **Bash-based task scheduler** that demonstrates how real-world schedulers are **designed, validated, and managed** before automation is introduced.

This project focuses on **CLI design, input validation, and safe task persistence**, making it ideal for showcasing **Linux, Bash, and DevOps fundamentals**.

---

## ��� Why This Project

Most schedulers jump straight to `cron`.

This project starts earlier:
- How are tasks **defined**?
- How are they **validated**?
- How are they **stored safely**?
- How do you **manage** them over time?

It reflects how production systems are **designed first, automated second**.

---

## ✨ Features

- ✅ Add scheduled tasks with validated input
- ✅ List all tasks from persistent storage
- ✅ Remove tasks safely by unique ID
- ✅ Handles commands with spaces correctly
- ✅ Defensive Bash scripting (`set -e`, `set -u`)
- ✅ Tasks persist across reboots

---

## Project Structure

```text
task-scheduler/
├── task_scheduler.sh
└── README.md
```

## Usage
Make the script executable:
```bash
chmod +x task_scheduler.sh
```

### Add a task
./task_scheduler.sh add daily 02:00 /home/user/scripts/backup.sh --full

### List tasks
./task_scheduler.sh list

### Remove a task
./task_scheduler.sh remove 1704708001
Tasks are removed using a filter-and-replace strategy to prevent file corruption.

## Design Higlights
- CLI-first design with clear verbs (add, list, remove)
- Safe argument parsing using positional parameters and shift
- File-based persistence
- Human-readable task definitions

## Input Validation
- Schedule type validation via case
- Time format validation using regex (HH:MM, 24-hour)

## Roadmap
- Enable / disable tasks
- Cron or systemd timer integration

