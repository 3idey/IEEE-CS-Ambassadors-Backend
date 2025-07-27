## What is a Database?

A **database** is an organized collection of structured information or data, typically stored electronically in a computer system. A **Database Management System (DBMS)** allows users to efficiently:

- Create
- Read
- Update
- Delete (CRUD operations)

**Examples**: MySQL, PostgreSQL, SQLite, Oracle, MongoDB

**Use Cases**:

- User information storage
- E-commerce transactions
- Web and mobile app data

---

## What is Normalization?

**Normalization** is the process of organizing data in a relational database to reduce **data redundancy** and improve **data integrity**.

It involves splitting large tables into smaller ones and defining relationships between them.

---

### 1NF – First Normal Form

- Each column must contain **atomic** (indivisible) values
- Each record must be **unique**
- No **repeating groups** or arrays

**Example (1NF-compliant):**

| ID  | Name | Phone  |
| --- | ---- | ------ |
| 1   | John | 123456 |
| 2   | Jane | 654321 |

**Not in 1NF:**

| ID  | Name | Phones         |
| --- | ---- | -------------- |
| 1   | John | 123456, 789012 |

---

### 2NF – Second Normal Form

- Must be in **1NF**
- All non-key attributes must depend on the **entire primary key** (no **partial dependencies**)

> Applies when the primary key is **composite** (i.e., made of more than one column)

---

### 3NF – Third Normal Form

- Must be in **2NF**
- No **transitive dependencies**
  - A non-key column should **not depend** on another non-key column

**Normalized Example**:

**Students Table**

| StudentID | Name | DeptID |
| --------- | ---- | ------ |

**Departments Table**

| DeptID | DeptName |

**Not in 3NF**:

| StudentID | Name | DeptName | DeptLocation |

Here, `DeptLocation` depends on `DeptName`, not on the primary key `StudentID`.

---
