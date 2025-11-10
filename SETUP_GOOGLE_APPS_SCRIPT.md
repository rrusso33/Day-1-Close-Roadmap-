# 🚀 Google Apps Script Setup for Real-Time Updates

Follow these steps to enable real-time updates from your Google Sheet.

## Step 1: Open Your Google Sheet

1. Go to your Google Sheet: [Day 1 Roadmap - Accounting Team](https://docs.google.com/spreadsheets/d/1OksIlKgk7mgRNd6mdijk7Fzi8-4BMYzH/)
2. Make sure you're on the tab: **"6 Week Sprints - Corp Accg"**

## Step 2: Open Apps Script Editor

1. In your Google Sheet, click **Extensions** → **Apps Script**
2. Delete any existing code in the editor
3. Copy and paste the script below

## Step 3: Copy This Script

```javascript
function doGet(e) {
  try {
    // Get the active spreadsheet
    const ss = SpreadsheetApp.getActiveSpreadsheet();
    
    // Get the specific sheet (update tab name if different)
    const sheet = ss.getSheetByName('6 Week Sprints - Corp Accg');
    
    if (!sheet) {
      return ContentService.createTextOutput(JSON.stringify({
        error: 'Sheet not found',
        availableSheets: ss.getSheets().map(s => s.getName())
      }))
      .setMimeType(ContentService.MimeType.JSON);
    }
    
    // Get all data from the sheet
    const dataRange = sheet.getDataRange();
    const values = dataRange.getValues();
    
    if (values.length === 0) {
      return ContentService.createTextOutput(JSON.stringify({
        error: 'No data found'
      }))
      .setMimeType(ContentService.MimeType.JSON);
    }
    
    // First row is headers
    const headers = values[0];
    
    // Convert to array of objects
    const data = [];
    for (let i = 1; i < values.length; i++) {
      const row = {};
      for (let j = 0; j < headers.length; j++) {
        row[headers[j]] = values[i][j];
      }
      data.push(row);
    }
    
    // Return as JSON
    return ContentService.createTextOutput(JSON.stringify({
      success: true,
      rowCount: data.length,
      data: data,
      lastUpdated: new Date().toISOString()
    }))
    .setMimeType(ContentService.MimeType.JSON);
    
  } catch (error) {
    return ContentService.createTextOutput(JSON.stringify({
      error: error.toString(),
      stack: error.stack
    }))
    .setMimeType(ContentService.MimeType.JSON);
  }
}
```

## Step 4: Deploy as Web App

1. Click the **Deploy** button (top right) → **New deployment**
2. Click the gear icon ⚙️ next to "Select type" → Choose **Web app**
3. Fill in the settings:
   - **Description**: "Day 1 Roadmap API"
   - **Execute as**: **Me** (your email)
   - **Who has access**: **Anyone** (this allows the roadmap to fetch data)
4. Click **Deploy**
5. Click **Authorize access** and grant permissions
6. **COPY THE WEB APP URL** (looks like: `https://script.google.com/macros/s/AKfycby.../exec`)

## Step 5: Update the Roadmap

1. Come back to this chat
2. Paste the Web App URL
3. I'll update your roadmap HTML to use it

## 🎯 Result

Once set up:
- ✅ Your team edits the Google Sheet
- ✅ Roadmap updates automatically (refresh page to see changes)
- ✅ No CSV files, no git commits needed
- ✅ True real-time collaboration

---

## 🔧 Troubleshooting

**If the tab name is different:**
- Change line 8 in the script: `const sheet = ss.getSheetByName('YOUR_TAB_NAME');`

**If you get permission errors:**
- Make sure you clicked "Authorize access" and approved all permissions
- Set "Execute as: Me" and "Who has access: Anyone"

**To test the API:**
- Paste your Web App URL in a browser - you should see JSON data

---

**Once you have the Web App URL, send it to me and I'll complete the setup!**

