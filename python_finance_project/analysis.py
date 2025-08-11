import yfinance as yf
import pandas as pd

def fetch_data(ticker_symbol, start_date, end_date):
    """Fetches historical stock data from Yahoo Finance."""
    data = yf.download(ticker_symbol, start=start_date, end=end_date)
    if data.empty:
        print(f"No data found for {ticker_symbol}. Please check the ticker.")
        return None
    print(f"Successfully fetched data for {ticker_symbol}")
    return data

if __name__ == "__main__":
    # --- Configuration ---
    ticker = 'AAPL'  # Example: Apple Inc.
    start = '2023-01-01'
    end = '2023-12-31'

    # --- Fetch Data ---
    stock_data = fetch_data(ticker, start, end)

    if stock_data is not None:
        print("\nFirst 5 rows of data:")
        print(stock_data.head())