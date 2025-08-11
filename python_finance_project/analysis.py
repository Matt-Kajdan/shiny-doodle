import yfinance as yf
import pandas as pd
import matplotlib.pyplot as plt
import warnings
import sys  # Import the sys module to access command-line arguments
import datetime as dt

# Suppress common pandas-related warnings without referencing removed internals
warnings.filterwarnings('ignore', category=FutureWarning)
warnings.filterwarnings('ignore', category=UserWarning)


def fetch_data(ticker_symbol, start_date, end_date):
    """Fetches historical stock data from Yahoo Finance."""
    data = yf.download(ticker_symbol, start=start_date, end=end_date)
    if data.empty:
        print(f"No data found for {ticker_symbol}. Please check the ticker.")
        return None
    print(f"Successfully fetched data for {ticker_symbol}")
    return data


def analyze_data(data):
    """Calculates financial metrics for the stock data."""
    data['MA20'] = data['Close'].rolling(window=20).mean()
    data['MA50'] = data['Close'].rolling(window=50).mean()
    data['Daily_Change_%'] = data['Close'].pct_change() * 100
    data['Volatility'] = data['Daily_Change_%'].rolling(window=20).std()
    print("\nAnalysis complete.")
    return data


def plot_data(data, ticker_symbol):
    """Plots the stock closing price and moving averages."""
    plt.style.use('seaborn-v0_8-darkgrid')
    plt.figure(figsize=(14, 7))
    plt.plot(data['Close'], label='Close Price', color='blue', alpha=0.8)
    plt.plot(data['MA20'], label='20-Day Moving Average', color='orange', linestyle='--')
    plt.plot(data['MA50'], label='50-Day Moving Average', color='red', linestyle='--')
    plt.title(f'{ticker_symbol} Stock Price Analysis', fontsize=16)
    plt.xlabel('Date', fontsize=12)
    plt.ylabel('Price (USD)', fontsize=12)
    plt.legend()
    plot_filename = f'{ticker_symbol}_analysis_plot.png'
    plt.savefig(plot_filename)
    print(f"\nPlot saved as {plot_filename}")
    plt.show()


def export_data(data, ticker_symbol):
    """Exports the data to a CSV file."""
    csv_filename = f'{ticker_symbol}_analyzed_data.csv'
    data.to_csv(csv_filename)
    print(f"Data exported to {csv_filename}")


def parse_cli_args(argv: list[str]) -> tuple[str, str, str]:
    """Parses CLI args: ticker [start] [end]. Dates are YYYY-MM-DD.
    Defaults to last 90 days ending today if dates omitted.
    Ensures dates are not in the future and start < end.
    Returns ISO date strings (YYYY-MM-DD).
    """
    today = dt.date.today()
    ninety_days = dt.timedelta(days=90)

    # Ticker
    if len(argv) > 1:
        ticker_symbol = argv[1].upper()
    else:
        ticker_symbol = 'AAPL'
        print("No ticker provided. Using default: AAPL")
        print("Usage: python analysis.py <TICKER_SYMBOL> [START_YYYY-MM-DD] [END_YYYY-MM-DD]")

    # End date
    if len(argv) > 3:
        try:
            end_date = dt.datetime.strptime(argv[3], "%Y-%m-%d").date()
        except ValueError:
            print(f"Invalid end date format: {argv[3]}. Expected YYYY-MM-DD. Using today.")
            end_date = today
    else:
        end_date = today

    if end_date > today:
        print(f"End date {end_date} is in the future. Using today {today} instead.")
        end_date = today

    # Start date
    if len(argv) > 2:
        try:
            start_date = dt.datetime.strptime(argv[2], "%Y-%m-%d").date()
        except ValueError:
            print(f"Invalid start date format: {argv[2]}. Expected YYYY-MM-DD. Using last 90 days.")
            start_date = end_date - ninety_days
    else:
        start_date = end_date - ninety_days

    if start_date > today:
        print(f"Start date {start_date} is in the future. Using last 90 days ending today.")
        start_date = end_date - ninety_days

    if start_date >= end_date:
        print(f"Start date {start_date} is not before end date {end_date}. Using last 90 days.")
        start_date = end_date - ninety_days

    return ticker_symbol, start_date.isoformat(), end_date.isoformat()


if __name__ == "__main__":
    # --- Configuration ---
    ticker, start, end = parse_cli_args(sys.argv)

    # --- Fetch Data ---
    stock_data = fetch_data(ticker, start, end)

    if stock_data is not None:
        # --- Analyze Data ---
        analyzed_data = analyze_data(stock_data)

        # --- Show Formatted Data ---
        print("\nData with analysis (last 5 rows):")
        display_data = analyzed_data[['Close', 'MA20', 'MA50', 'Daily_Change_%', 'Volatility']].tail()
        print(display_data.round(2).to_string())

        # --- Export and Plot ---
        export_data(analyzed_data, ticker)
        plot_data(analyzed_data, ticker)