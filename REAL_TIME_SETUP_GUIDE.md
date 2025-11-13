# 🔄 Real-Time Data Connection Setup Guide

This guide will help you connect your Google Sheet directly to the roadmap so updates happen automatically in real-time!

---

## 📋 Overview

Instead of manually exporting CSV files, you'll set up a Google Apps Script that:
- ✅ Pulls data directly from your Google Sheet
- ✅ Updates the roadmap in real-time (no manual export needed)
- ✅ Refreshes automatically when you reload the page

**Setup Time:** ~10 minutes

---

## 🚀 Step-by-Step Setup

### **Step 1: Open Your Google Sheet**

1. Open your `roadmap_data` Google Sheet (the one with all your tasks)
2. Make sure it has these columns:
   - Team
   - Sprint Set
   - Date
   - Close Category
   - OKR
   - Status
   - Owner(s)
   - Hours Saved
   - Dependencies
   - Key Result
   - Week Focus and Tasks
   - Day 1 Close Target End Date

---

### **Step 2: Create Google Apps Script**

1. In your Google Sheet, click **Extensions** → **Apps Script**
2. Delete any existing code
3. **Copy and paste this code:**

```javascript
function doGet(e) {
  try {
    const sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();
    const data = sheet.getDataRange().getValues();
    
    // First row is headers
    const headers = data[0];
    const rows = data.slice(1);
    
    // Convert to array of objects
    const jsonData = rows.map(row => {
      const obj = {};
      headers.forEach((header, index) => {
        obj[header] = row[index] !== null && row[index] !== undefined ? String(row[index]) : '';
      });
      return obj;
    });
    
    const response = {
      success: true,
      data: jsonData,
      lastUpdated: new Date().toISOString(),
      totalRecords: jsonData.length
    };
    
    return ContentService
      .createTextOutput(JSON.stringify(response))
      .setMimeType(ContentService.MimeType.JSON);
      
  } catch (error) {
    return ContentService
      .createTextOutput(JSON.stringify({
        success: false,
        error: error.toString()
      }))
      .setMimeType(ContentService.MimeType.JSON);
  }
}
```

4. Click **Save** (💾 icon) and name your project: `Roadmap Data API`

---

### **Step 3: Deploy as Web App**

1. Click the blue **Deploy** button → **New deployment**
2. Click the ⚙️ gear icon next to "Select type"
3. Choose **Web app**
4. Fill in the settings:
   - **Description:** `Roadmap Data Endpoint`
   - **Execute as:** `Me`
   - **Who has access:** `Anyone` (don't worry, only people with the link can access)
5. Click **Deploy**
6. Click **Authorize access** and choose your Google account
7. If you see a security warning:
   - Click **Advanced**
   - Click **Go to Roadmap Data API (unsafe)** - this is safe, it's your own script
8. **IMPORTANT:** Copy the **Web app URL** - it looks like:
   ```
   https://script.google.com/macros/s/XXXXX.../exec
   ```

---

### **Step 4: Connect to Your Roadmap**

1. Open `BD5_to_BD1_Roadmap.html` in a text editor (Notepad, VS Code, etc.)
2. Find line 984 (near the top of the JavaScript section):
   ```javascript
   const APPS_SCRIPT_URL = ''; // Paste your Web App URL here
   ```
3. Paste your Web App URL between the quotes:
   ```javascript
   const APPS_SCRIPT_URL = 'https://script.google.com/macros/s/XXXXX.../exec';
   ```
4. Save the file

---

### **Step 5: Deploy the Updated Roadmap**

**Option A: Using the Batch File**
1. Double-click `UPDATE_ROADMAP.bat`
2. It will automatically push your changes to GitHub

**Option B: Using Git Commands**
```bash
git add BD5_to_BD1_Roadmap.html
git commit -m "Connect real-time data from Google Sheets"
git push origin main
```

---

## ✅ Testing Your Connection

1. Wait 2-3 minutes for GitHub Pages to update
2. Open your live roadmap: https://rrusso33.github.io/Day-1-Close-Roadmap-/BD5_to_BD1_Roadmap.html
3. Open your browser console (F12 → Console tab)
4. You should see:
   ```
   📡 Fetching real-time data from Google Sheets...
   ✅ Loaded XX tasks from Google Sheets (Live)
   🕒 Last updated: [timestamp]
   ```

---

## 🎯 How to Use Real-Time Updates

### **To Update Your Roadmap:**
1. Edit your Google Sheet (change status, add tasks, update hours saved, etc.)
2. Reload your roadmap page
3. ✨ **That's it!** Your changes appear instantly - no CSV export needed!

### **Update Frequency:**
- Data refreshes every time someone loads the page
- No caching - always shows current data
- Multiple people can edit the sheet simultaneously

---

## 🔧 Troubleshooting

### **Problem: "Loading roadmap data..." never finishes**

**Solution 1:** Check your Apps Script URL
- Make sure you pasted the full URL in line 984
- URL should end with `/exec` (not `/dev`)

**Solution 2:** Check script permissions
- Go back to Apps Script
- Click Deploy → Manage deployments
- Make sure "Who has access" is set to "Anyone"

**Solution 3:** Test the script directly
- Copy your Web App URL
- Paste it in a new browser tab
- You should see JSON data (not an error)

### **Problem: "Error loading data"**

**Solution:** Check your sheet structure
- Make sure the first row contains headers
- Column names should match exactly (case-sensitive)
- No extra spaces in column names

### **Problem: Updates not showing**

**Solution:** Clear browser cache
- Press `Ctrl+Shift+R` (Windows) or `Cmd+Shift+R` (Mac)
- This forces a hard reload

---

## 🔐 Security Notes

- ✅ **Safe:** Your script only reads data (no write access)
- ✅ **Private:** Only people with the URL can access the data
- ✅ **No credentials needed:** The sheet itself remains private in your Google Drive

---

## 📊 Benefits of Real-Time Connection

| Manual CSV | Real-Time Google Sheets |
|------------|-------------------------|
| ❌ Export CSV manually | ✅ Auto-syncs on page load |
| ❌ Save file to folder | ✅ Edit directly in Sheets |
| ❌ Run update batch file | ✅ Just refresh the page |
| ❌ Wait 2-3 min for deploy | ✅ Instant updates |
| ❌ Risk of using old data | ✅ Always current |

---

## 🎉 Next Steps

Once connected, you can:
1. **Share the live link** with your CAO - they'll always see current data
2. **Edit on mobile** - update status from your phone, view on roadmap instantly
3. **Collaborate** - multiple team members can update the sheet at once
4. **Track in real-time** - refresh during meetings to show live progress

---

## 📞 Need Help?

If you run into issues:
1. Check the troubleshooting section above
2. Test your Apps Script URL in a browser
3. Check the browser console (F12) for error messages

---

**Ready to go live?** Follow the steps above and your roadmap will update automatically! 🚀

