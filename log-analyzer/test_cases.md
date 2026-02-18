# Test Cases – log_analyzer.sh

---

## 1. Valid Log File

Command:
./log_analyzer.sh sample_logs/app.log

Expected:
- Correct total line count
- Correct INFO, WARNING, ERROR counts
- Last ERROR printed
- Exit code: 0

---

## 2. Empty Log File

Command:
./log_analyzer.sh sample_logs/empty.log

Expected:
- Total Lines: 0
- INFO: 0
- WARNING: 0
- ERROR: 0
- "No ERROR entries found."
- Exit code: 0

---

## 3. Missing Argument

Command:
./log_analyzer.sh

Expected:
- Error message
- Exit code: 1

---

## 4. File Does Not Exist

Command:
./log_analyzer.sh fake.log

Expected:
- Error message
- Exit code: 2

---

## 5. File Not Readable

Command:
chmod 000 sample_logs/app.log
./log_analyzer.sh sample_logs/app.log

Expected:
- Error message
- Exit code: 3

---

## 6. Log Without ERROR Entries

Command:
./log_analyzer.sh no_error.log

Expected:
- ERROR Count: 0
- "No ERROR entries found."
- Exit code: 0
