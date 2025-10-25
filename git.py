#!/usr/bin/env python3
"""
Automated Git Commit Generator for specific dates
"""

import os
import subprocess
import datetime
import random
from pathlib import Path

def run_command(cmd, env=None, cwd=None):
    """Run a shell command and return the result"""
    try:
        result = subprocess.run(cmd, shell=True, check=True, 
                              capture_output=True, text=True, env=env, cwd=cwd)
        return result.stdout
    except subprocess.CalledProcessError as e:
        print(f"Error running command: {cmd}")
        print(f"Error: {e}")
        return None

def setup_repository(repo_name="git-commit-generator"):
    """Create and setup the test git repository"""
    repo_path = Path(repo_name)
    
    if repo_path.exists():
        print(f"Repository '{repo_name}' already exists. Removing...")
        run_command(f"rm -rf {repo_path}")
    
    repo_path.mkdir(exist_ok=True)
    os.chdir(repo_path)
    
    # Initialize git repository
    run_command("git init")
    run_command('git config user.name "Commit Generator"')
    run_command('git config user.email "generator@example.com"')
    
    print(f"Repository setup at: {repo_path.absolute()}")
    return repo_path

def generate_commit_content(date):
    """Generate random commit content to make commits more realistic"""
    activities = [
        "Fixed bug in user authentication",
        "Added new feature for dashboard",
        "Refactored database queries",
        "Updated documentation",
        "Improved UI responsiveness",
        "Optimized image loading",
        "Fixed typo in README",
        "Added unit tests",
        "Updated dependencies",
        "Implemented caching mechanism",
        "Fixed mobile layout issues",
        "Added error handling",
        "Performance improvements",
        "Code cleanup and comments",
        "Security enhancements",
        "Resolved merge conflicts",
        "Enhanced API endpoints",
        "Updated CI/CD pipeline",
        "Fixed security vulnerability",
        "Improved test coverage"
    ]
    
    file_types = [
        "models/user.py",
        "views/dashboard.html",
        "controllers/auth.js",
        "styles/main.css",
        "utils/helpers.py",
        "config/settings.json",
        "tests/test_auth.py",
        "docs/api.md",
        "scripts/deploy.sh",
        "database/schema.sql",
        "src/app.py",
        "src/config.py",
        "src/models.py",
        "src/views.py",
        "package.json",
        "requirements.txt"
    ]
    
    activity = random.choice(activities)
    file_type = random.choice(file_types)
    
    return f"{activity} in {file_type}"

def create_commits_for_date(target_date, num_commits=1):
    """Create commits for a specific date"""
    date_str = target_date.strftime("%Y-%m-%d")
    day_name = target_date.strftime("%A")
    
    print(f"  📅 {date_str} ({day_name}): Creating {num_commits} commit(s)")
    
    commits_created = 0
    
    for commit_num in range(num_commits):
        # Vary commit times throughout the day
        if num_commits == 1:
            hour = random.randint(14, 16)  # Single commit around afternoon
        else:
            # Spread multiple commits throughout work hours
            hour = random.randint(9, 18)
        
        minute = random.randint(0, 59)
        second = random.randint(0, 59)
        
        commit_time = datetime.datetime(
            target_date.year, target_date.month, target_date.day, 
            hour, minute, second
        )
        datetime_str = commit_time.strftime("%Y-%m-%d %H:%M:%S")
        
        # Set environment variables for git commit date
        env = os.environ.copy()
        env['GIT_AUTHOR_DATE'] = datetime_str
        env['GIT_COMMITTER_DATE'] = datetime_str
        
        # Generate realistic commit content
        commit_message = generate_commit_content(target_date)
        
        # Create or modify a random file
        filename = random.choice([
            "src/main.py", "src/utils.py", "src/config.py",
            "docs/README.md", "tests/test_main.py",
            "assets/style.css", "scripts/deploy.sh",
            "src/app.py", "src/models.py", "package.json"
        ])
        
        # Create directory if it doesn't exist
        Path(filename).parent.mkdir(parents=True, exist_ok=True)
        
        # Append to file instead of overwriting to preserve history
        with open(filename, 'a') as f:
            f.write(f"# Update on {date_str} at {hour:02d}:{minute:02d} - {commit_message}\n")
        
        # Add and commit the file
        run_command(f"git add {filename}", env=env)
        run_command(f'git commit -m "{commit_message}"', env=env)
        
        commits_created += 1
        print(f"    ✅ {hour:02d}:{minute:02d} - {commit_message}")
    
    return commits_created

def main():
    """Main function to create commits for specified dates"""
    
    # ==============================
    # CONFIGURATION SECTION
    # ==============================
    
    # Define specific dates and number of commits for each date
    # Format: (year, month, day, number_of_commits)
    TARGET_DATES = [
        # June 2025 - Important project dates
        (2025, 6, 2, 3),    # Project kickoff - multiple commits
        (2025, 6, 5, 2),    # Feature development
        (2025, 6, 10, 4),   # Major feature completion
        (2025, 6, 15, 1),   # Bug fixing day
        (2025, 6, 20, 3),   # Code review and updates
        (2025, 6, 25, 2),   # Documentation updates
        (2025, 6, 30, 5),   # End of month release
        
        # July 2025 - Sprint cycles
        (2025, 7, 1, 3),    # Sprint planning implementation
        (2025, 7, 7, 2),    # Mid-sprint updates
        (2025, 7, 14, 4),   # Sprint review preparation
        (2025, 7, 15, 1),   # Sprint review day
        (2025, 7, 21, 3),   # New sprint start
        (2025, 7, 28, 2),   # Feature implementation
        
        # August 2025 - Project completion
        (2025, 8, 4, 3),    # Final features
        (2025, 8, 11, 4),   # Testing phase
        (2025, 8, 18, 2),   # Bug fixes
        (2025, 8, 25, 5),   # Final release preparation
        (2025, 8, 29, 3),   # Last minute updates
    ]
    
    # Or define date ranges with specific patterns
    WEEKEND_DATES = [
        (2025, 6, 7, 1),    # Saturday - light work
        (2025, 6, 8, 1),    # Sunday - light work  
        (2025, 6, 14, 1),
        (2025, 6, 15, 1),
        (2025, 6, 21, 1),
        (2025, 6, 22, 1),
        (2025, 6, 28, 1),
        (2025, 6, 29, 1),
    ]
    
    # Repository name
    REPO_NAME = "targeted-commits-2025"
    
    # ==============================
    # EXECUTION SECTION
    # ==============================
    
    print("🚀 Starting Targeted Commit Generator")
    print("=" * 50)
    
    # Display configuration
    print("Target Dates Configuration:")
    for year, month, day, commits in TARGET_DATES:
        date_obj = datetime.datetime(year, month, day)
        date_str = date_obj.strftime("%Y-%m-%d (%A)")
        print(f"  - {date_str}: {commits} commit(s)")
    
    if WEEKEND_DATES:
        print("\nWeekend Dates:")
        for year, month, day, commits in WEEKEND_DATES:
            date_obj = datetime.datetime(year, month, day)
            date_str = date_obj.strftime("%Y-%m-%d (%A)")
            print(f"  - {date_str}: {commits} commit(s)")
    
    print(f"\nRepository: {REPO_NAME}")
    print("=" * 50)
    
    # Setup repository
    original_dir = os.getcwd()
    try:
        repo_path = setup_repository(REPO_NAME)
        
        total_commits = 0
        
        # Process main target dates
        print("\n📝 Creating commits for target dates...")
        for year, month, day, num_commits in TARGET_DATES:
            try:
                target_date = datetime.datetime(year, month, day)
                commits_created = create_commits_for_date(target_date, num_commits)
                total_commits += commits_created
            except ValueError as e:
                print(f"    ❌ Invalid date: {year}-{month:02d}-{day:02d} - {e}")
        
        # Process weekend dates (optional)
        if WEEKEND_DATES:
            print("\n🏖️  Creating commits for weekend dates...")
            for year, month, day, num_commits in WEEKEND_DATES:
                try:
                    target_date = datetime.datetime(year, month, day)
                    commits_created = create_commits_for_date(target_date, num_commits)
                    total_commits += commits_created
                except ValueError as e:
                    print(f"    ❌ Invalid date: {year}-{month:02d}-{day:02d} - {e}")
        
        print(f"\n🎉 Successfully created {total_commits} total commits!")
        print(f"📁 Repository location: {repo_path.absolute()}")
        
        # Show git log summary
        print("\n📊 Git log summary (last 15 commits):")
        log_output = run_command("git log --oneline -15")
        if log_output:
            print(log_output)
            
        # Show commit statistics by date
        print("\n📈 Commit statistics by date:")
        stats_output = run_command('git log --format="%ad" --date=short | sort | uniq -c')
        if stats_output:
            print("Commits per day:")
            print(stats_output)
            
        # Show total commit count
        count_output = run_command("git rev-list --count HEAD")
        if count_output:
            print(f"Total commits in repository: {count_output.strip()}")
            
    except Exception as e:
        print(f"❌ Error: {e}")
    finally:
        os.chdir(original_dir)

if __name__ == "__main__":
    main()