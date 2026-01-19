import os
import csv
from collections import Counter

def classify(score: int) -> str:
    if score >= 80:
        return "HIGH"
    if score >= 60:
        return "MEDIUM"
    return "LOW"

def main():
    input_path = "data/sample.csv"
    rows = []

    with open(input_path, newline="", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        for r in reader:
            score = int(r["score"])
            category = classify(score)
            rows.append({"name": r["name"], "score": score, "category": category})

    counts = Counter(r["category"] for r in rows)

    # report a schermo
    print("=== CSV Data Analysis Report ===")
    for r in rows:
        print(f'{r["name"]}: score={r["score"]} -> {r["category"]}')
    print("\nSummary:", dict(counts))

    # report su file
    os.makedirs("output", exist_ok=True)
    
    with open("output/report.txt", "w", encoding="utf-8") as out:
        out.write("CSV Data Analysis Report\n")
        for r in rows:
            out.write(f'{r["name"]}, {r["score"]}, {r["category"]}\n')
        out.write(f"\nSummary: {dict(counts)}\n")

if __name__ == "__main__":
    main()
