python
from github import Github

def github_push(repo_name, file_path, content, commit_message="Update file", branch='main'):
    # Initialize a Github instance with your token
    g = Github("your_github_token")
    
    # Get the repository
    repo = g.get_repo(repo_name)
    
    # Read the contents of the file if it already exists
    try:
        contents = repo.get_contents(file_path, ref=branch)
        sha = contents.sha
    except Exception:
        sha = None

    # Update or create the file
    if sha is not None:
        repo.update_file(file_path, commit_message, content, sha, branch=branch)
    else:
        repo.create_file(file_path, commit_message, content, branch=branch)

# Example usage
github_push(repo='your_username/actual_repo', file='y.txt', content='y')
