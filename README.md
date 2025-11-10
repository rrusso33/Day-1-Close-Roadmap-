# BD5 to BD1 Close Acceleration Roadmap

## 🔗 Live Integration with Google Sheets

This roadmap pulls real-time data from your Google Sheet: [Accounting Roadmap](https://docs.google.com/spreadsheets/d/1OksIlKgk7mgRNd6mdijk7Fzi8-4BMYzH/edit?gid=263457723#gid=263457723)

### Setup Instructions:

#### Step 1: Publish Your Google Sheet
1. Open your Google Sheet
2. Go to **File → Share → Publish to web**
3. Select **"Accounting Roadmap"** tab
4. Choose **"Comma-separated values (.csv)"** or **"Web page"**
5. Click **Publish**
6. Copy the published URL

#### Step 2: Update the Roadmap Configuration
The roadmap is configured to read from your sheet automatically.

### How It Works:
- Your team updates the Google Sheet
- The roadmap fetches latest data every time it loads
- Progress bars, status badges, and completion % update automatically
- No manual HTML editing needed!

### Column Structure Expected:
- **Phase**: M1, M3, M4, M5, M6
- **Task Name**: Name of the task
- **Status**: Complete, In Progress, Not Started, Blocked
- **Hours Saved**: Number of hours
- **Assignee**: Person responsible
- **Tool**: Technology being used
- **Notes**: Additional context

---

## 📝 How to Update:

1. Update tasks in Google Sheet "Accounting Roadmap" tab
2. Refresh the roadmap HTML in browser
3. See changes reflected immediately!

---

## 🚀 Deployment:

The roadmap is synced to GitHub: https://github.com/rrusso33/Day-1-Close-Roadmap-

Every update is automatically committed and pushed.

