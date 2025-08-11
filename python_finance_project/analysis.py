import yfinance as yf
import pandas as pd
import matplotlib.pyplot as plt
import warnings

# Suppress SettingWithCopyWarning, common in pandas
warnings.filterwarnings('ignore', category=pd.core.common.SettingWithCopyWarning)

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
    # Calculate Moving Averages (20-day and 50-day)
    data['MA20'] = data['Close'].rolling(window=20).mean()
    data['MA50'] = data['Close'].rolling(window=50).mean()

    # Calculate Daily Percentage Change
    data['Daily_Change_%'] = data['Close'].pct_change() * 100

    # Calculate Volatility (standard deviation of daily returns)
    data['Volatility'] = data['Daily_Change_%'].rolling(window=20).std()

    print("\nAnalysis complete.")
    return data

def plot_data(data, ticker_symbol):
    """Plots the stock closing price and moving averages."""
    plt.style.use('seaborn-v0_8-darkgrid') # Use a nice style for the plot
    plt.figure(figsize=(14, 7))
    plt.plot(data['Close'], label='Close Price', color='blue', alpha=0.8)
    plt.plot(data['MA20'], label='20-Day Moving Average', color='orange', linestyle='--')
    plt.plot(data['MA50'], label='50-Day Moving Average', color='red', linestyle='--')
    plt.title(f'{ticker_symbol} Stock Price Analysis', fontsize=16)
    plt.xlabel('Date', fontsize=12)
    plt.ylabel('Price (USD)', fontsize=12)
    plt.legend()

    # Save the plot to a file
    plot_filename = f'{ticker_symbol}_analysis_plot.png'
    plt.savefig(plot_filename)
    print(f"\nPlot saved as {plot_filename}")
    plt.show()

def export_data(data, ticker_symbol):
    """Exports the data to a CSV file."""
    csv_filename = f'{ticker_symbol}_analyzed_data.csv'
    data.to_csv(csv_filename)
    print(f"Data exported to {csv_filename}")

if __name__ == "__main__":
    # --- Configuration ---
    ticker = 'AAPL'  # Example: Apple Inc.
    start = '2023-01-01'
    end = '2023-12-31'

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