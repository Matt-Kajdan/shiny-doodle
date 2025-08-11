# Python Finance Project

A Python project for financial analysis and data processing.

## Setup

1. Create a virtual environment:
   ```bash
   python -m venv venv
   ```

2. Activate the virtual environment:
   - **Windows:**
     ```bash
     venv\Scripts\activate
     ```
   - **macOS/Linux:**
     ```bash
     source venv/bin/activate
     ```

3. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```

## Usage

Run the analysis script with defaults (AAPL, last ~90 days):
```bash
python analysis.py
```

Provide a different ticker (still defaults to last ~90 days ending today):
```bash
python analysis.py TSLA
```

Provide a custom date range (YYYY-MM-DD):
```bash
python analysis.py TSLA 2024-01-01 2024-06-30
```

Notes:
- If dates are omitted, the script uses the last 90 days ending today.
- Future dates are clamped to today automatically.
- If the start date is invalid or not before the end date, the script falls back to the last 90 days.

## Project Structure

- `analysis.py` - Main analysis script
- `README.md` - Project documentation
- `requirements.txt` - Python dependencies
- `.gitignore` - Git ignore rules

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request
