# 📊 Netflix Data Analysis Project

## 🎯 Project Overview
This project focuses on analyzing Netflix's dataset using SQL to uncover key insights about its content library, such as trends in movie releases, popular genres, and ratings distribution. The goal is to leverage SQL queries to extract meaningful information and visualize the data for better decision-making.

## 🗃️ Dataset
The dataset contains the following columns:
- **Show ID**: Unique identifier for each show
- **Type**: Movie or TV Show
- **Title**: Name of the show
- **Director**: Director's name
- **Cast**: Lead actors/actresses
- **Country**: Country of origin
- **Date Added**: Date the show was added to Netflix
- **Release Year**: Year of release
- **Rating**: Age rating (e.g., PG, R, TV-MA)
- **Duration**: Duration in minutes (for movies) or number of seasons (for TV shows)
- **Genres**: Show's listed genres
- **Description**: Brief synopsis of the show

## 🔍 Key Objectives
1. **Content Distribution**: Analyzing the number of movies and TV shows available.
2. **Release Trends**: Finding the most popular release years and months.
3. **Country Analysis**: Determining which countries produce the most content.
4. **Genre Insights**: Identifying the most common genres.
5. **Rating Breakdown**: Understanding the distribution of age ratings.

## 📈 SQL Queries
The project leverages a series of SQL queries to extract and analyze data. Some key queries include:

### 1. Count of Movies vs TV Shows
```sql
SELECT type, COUNT(*) AS count
FROM netflix
GROUP BY type;
```

### 2. Top 5 Countries by Number of Titles
```sql
SELECT country, COUNT(*) AS count
FROM netflix
GROUP BY country
ORDER BY count DESC
LIMIT 5;
```

### 3. Most Popular Release Years
```sql
SELECT release_year, COUNT(*) AS count
FROM netflix
GROUP BY release_year
ORDER BY count DESC;
```

### 4. Most Common Genres
```sql
SELECT genre, COUNT(*) AS count
FROM netflix
CROSS JOIN UNNEST(string_to_array(listed_in, ',')) AS genre
GROUP BY genre
ORDER BY count DESC;
```

## 📊 Insights
- **Movies dominate** Netflix's library compared to TV shows.
- **United States** produces the most content, followed by India.
- The most popular release years show a trend of **recent releases** dominating the platform.
- **Drama** and **Comedies** are the most common genres.
- The majority of content is rated **TV-MA** and **PG-13**.

## 🛠️ Tools Used
- **PostgreSQL**: For writing and executing SQL queries.
- **Power BI**: For data visualization (optional — can be expanded later).
- **Git/GitHub**: For version control and project collaboration.

## 🚀 How to Run the Project
1. Clone the repository:
```bash
git clone https://github.com/yourusername/netflix-sql-analysis.git
```
2. Import the dataset into your PostgreSQL database.
3. Run the SQL scripts provided in the `scripts` folder.
4. (Optional) Connect your database to Power BI for visualization.

## 📚 Future Enhancements
- Integrate visualizations using Power BI.
- Implement more complex queries like window functions and CTEs.
- Add time-series analysis for release trends.

## 📞 Contact
For any questions or collaboration opportunities, feel free to reach out!

- **LinkedIn**: [yourprofile](https://www.linkedin.com/in/maha-pragalathan-831633266/?trk=opento_sprofile_details)
- **Email**: pmaga205@gmail.com

---

*This project is a part of my data analytics journey, showcasing my skills in SQL and data analysis.*

---

Would you like me to customize the contact details or add anything specific about the SQL techniques you used? Let me know!

