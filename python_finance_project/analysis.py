import yfinance as yf
import pandas as pd

def fetch_data(ticker_symbol, start_date, end_date):
    """Fetches historical stock data from Yahoo Finance."""
    data = yf.download(ticker_symbol, start=start_date, end=end_date, auto_adjust=False)
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

    print("\nAnalysis complete. Added MA20, MA50, Daily_Change_%, and Volatility.")
    return data

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
        # Format the display with fewer decimal places for readability
        display_data = analyzed_data[['Close', 'MA20', 'MA50', 'Daily_Change_%', 'Volatility']].tail()
        display_data = display_data.round(2)  # Round to 2 decimal places
        print(display_data.to_string())