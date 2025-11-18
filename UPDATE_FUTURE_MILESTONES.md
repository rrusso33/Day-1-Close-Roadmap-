# 📅 How to Update Future Milestones

## Overview

Your Multi-Quarter Executive Roadmap shows high-level strategic milestones for Q4 FY26 → Q3 FY27. This is separate from your detailed task data and perfect for CFO/executive viewing.

---

## 🎯 Two Types of Data

### 1. **Detailed Tasks** (`roadmap_data.csv`)
- Week-by-week tasks and initiatives
- Shows in: Category timelines, Master timeline, Initiative cards
- Update frequently (weekly/bi-weekly)

### 2. **Future Milestones** (`future_milestones.csv`)
- High-level quarterly goals
- Shows in: Multi-Quarter Executive Roadmap at the top
- Update quarterly or when major milestones change

---

## ✏️ How to Update Future Milestones

### **Method 1: Edit the CSV Directly**

1. Open `future_milestones.csv` in Excel or text editor
2. Add/edit rows with these columns:
   - **Quarter:** Q4'26, Q1'27, Q2'27, Q3'27
   - **End of Week Deliverable / Milestone:** Description of the milestone
   - **Day 1 Close Target End Date:** Target date (4/30/26, 7/31/26, etc.)
   - **Close Category:** Accruals, Cash, Payroll, etc.

3. Save the file
4. Run `UPDATE_ROADMAP.bat`
5. Wait 2 minutes and refresh!

### **Example Row:**
```
Q1'27,Complete FY26 Audit,7/31/26,Audit
```

---

## 📋 Template Format

```csv
Quarter,End of Week Deliverable / Milestone,Day 1 Close Target End Date,Close Category
Q4'26,Your milestone here,4/30/26,Your category
Q1'27,Your milestone here,7/31/26,Your category
Q2'27,Your milestone here,10/31/26,Your category
Q3'27,Close books by end of BD1,1/31/27,Close Management
```

---

## 🎨 What the CFO Sees

The Multi-Quarter Roadmap appears at the top with **quarter cards**:

```
┌─────────────────────────┐  ┌─────────────────────────┐
│  Q4 FY26 (Apr 30, 2026) │  │  Q1 FY27 (Jul 31, 2026) │
│  Foundation Complete    │  │  Optimization Phase     │
├─────────────────────────┤  ├─────────────────────────┤
│ • Close Cash by BD1     │  │ • Launch PEO            │
│ • Automate accruals     │  │ • Complete FY26 Audit   │
│ • Automate payroll      │  │ • Pull Mexico/Turkey... │
└─────────────────────────┘  └─────────────────────────┘

┌─────────────────────────┐  ┌─────────────────────────┐
│  Q2 FY27 (Oct 31, 2026) │  │  Q3 FY27 (Jan 31, 2027) │
│  Acceleration Phase     │  │  🎯 BD1 TARGET!         │
├─────────────────────────┤  ├─────────────────────────┤
│ • Close Cash by BD0     │  │ • Close books by BD1    │
│ • Tax accruals BD0      │  │ • Day 1 Close Achieved! │
│ • Revenue recorded BD0  │  │                         │
└─────────────────────────┘  └─────────────────────────┘
```

---

## 💡 Best Practices

### **For CFO Presentations:**
1. **Before board meetings:** Update major milestones to reflect current plans
2. **After OKR reviews:** Add new strategic initiatives
3. **Quarterly planning:** Refresh all quarter cards with latest targets

### **Keep it High-Level:**
- ✅ "Complete FY26 Audit"
- ✅ "Launch PEO for first customer"
- ✅ "Close Cash by BD0"
- ❌ "Week 3 Sprint Set 2 Task #47"

### **When to Update:**
- **Quarterly:** Review all milestones
- **Monthly:** Add/remove as needed
- **Before CFO meetings:** Ensure current

---

## 🚀 Quick Update Workflow

```
1. Edit future_milestones.csv
2. Double-click UPDATE_ROADMAP.bat
3. Wait 2 minutes
4. Refresh roadmap
5. Show CFO! 🎯
```

---

## 📂 File Location

Both files are in: `C:\Users\rachele.russo\Desktop\Day 1 Road Map\`

- **Detailed tasks:** `roadmap_data.csv`
- **Future milestones:** `future_milestones.csv`

---

## 🎯 Categories Available

Use these for consistency:
- Accruals
- Cash & Cash Equivalents
- Intercompany
- Leases
- Payroll
- Sales Commissions
- Close Management
- Financial Reporting
- Acquisition
- Prepaids
- Fixed Assets
- PEO
- Audit
- Tax
- Revenue

---

**Your CFO will love the high-level quarterly view!** 📊✨

