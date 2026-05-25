from pathlib import Path
import sqlite3
import pandas as pd


# Define project paths
PROJECT_ROOT = Path(__file__).resolve().parents[1]
PROCESSED_DATA_PATH = PROJECT_ROOT / "data" / "processed"
DATABASE_PATH = PROCESSED_DATA_PATH / "ecommerce_fulfilment.db"


def load_csv(file_name: str) -> pd.DataFrame:
    """
    Load a CSV file from the processed data folder.
    """
    file_path = PROCESSED_DATA_PATH / file_name

    if not file_path.exists():
        raise FileNotFoundError(f"File not found: {file_path}")

    return pd.read_csv(file_path)


def main():
    """
    Create a SQLite database from processed CSV files.
    """

    print("Creating SQLite database...")
    print(f"Database path: {DATABASE_PATH}")

    # Load processed CSV files
    analysis_ready_orders = load_csv("analysis_ready_orders.csv")
    kpi_summary = load_csv("kpi_summary.csv")
    review_by_delivery_status = load_csv("review_by_delivery_status.csv")
    state_summary = load_csv("state_summary.csv")
    category_summary = load_csv("category_summary.csv")

    # Connect to SQLite database
    # If the database does not exist, SQLite will create it automatically.
    connection = sqlite3.connect(DATABASE_PATH)

    # Save each dataframe as a SQL table
    analysis_ready_orders.to_sql(
        "analysis_ready_orders",
        connection,
        if_exists="replace",
        index=False
    )

    kpi_summary.to_sql(
        "kpi_summary",
        connection,
        if_exists="replace",
        index=False
    )

    review_by_delivery_status.to_sql(
        "review_by_delivery_status",
        connection,
        if_exists="replace",
        index=False
    )

    state_summary.to_sql(
        "state_summary",
        connection,
        if_exists="replace",
        index=False
    )

    category_summary.to_sql(
        "category_summary",
        connection,
        if_exists="replace",
        index=False
    )

    # Check tables created
    tables = pd.read_sql_query(
        "SELECT name FROM sqlite_master WHERE type='table';",
        connection
    )

    print("\nTables created:")
    print(tables)

    # Check row counts
    for table_name in tables["name"]:
        row_count = pd.read_sql_query(
            f"SELECT COUNT(*) AS row_count FROM {table_name};",
            connection
        )
        print(f"{table_name}: {row_count.loc[0, 'row_count']} rows")

    connection.close()

    print("\nSQLite database created successfully.")


if __name__ == "__main__":
    main()