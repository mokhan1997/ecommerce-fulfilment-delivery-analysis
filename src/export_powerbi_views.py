from pathlib import Path
import sqlite3
import pandas as pd


# Define project paths
PROJECT_ROOT = Path(__file__).resolve().parents[1]
DATABASE_PATH = PROJECT_ROOT / "data" / "processed" / "ecommerce_fulfilment.db"
POWERBI_EXPORT_PATH = PROJECT_ROOT / "data" / "processed" / "powerbi_views"


def export_view(connection, view_name: str, output_file_name: str):
    """
    Export a SQLite view into a CSV file.
    """

    query = f"SELECT * FROM {view_name};"

    df = pd.read_sql_query(query, connection)

    output_path = POWERBI_EXPORT_PATH / output_file_name

    df.to_csv(output_path, index=False)

    print(f"Exported {view_name} to {output_path}")
    print(f"Rows: {len(df)} | Columns: {df.shape[1]}")
    print("-" * 60)


def main():
    """
    Export SQL views into CSV files for Power BI.
    """

    if not DATABASE_PATH.exists():
        raise FileNotFoundError(f"Database not found: {DATABASE_PATH}")

    POWERBI_EXPORT_PATH.mkdir(parents=True, exist_ok=True)

    connection = sqlite3.connect(DATABASE_PATH)

    views_to_export = {
        "v_order_level_dashboard": "order_level_dashboard.csv",
        "v_state_delivery_performance": "state_delivery_performance.csv",
        "v_category_performance": "category_performance.csv",
        "v_delay_band_review_score": "delay_band_review_score.csv",
        "v_seller_state_performance": "seller_state_performance.csv"
    }

    for view_name, output_file_name in views_to_export.items():
        export_view(connection, view_name, output_file_name)

    connection.close()

    print("Power BI view exports completed successfully.")


if __name__ == "__main__":
    main()