install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

format:
	#black *.py

lint:
	#pylint --disable=R,C --ignore-patterns=test_.*?py *.py

test:
	pytest --nbval main.ipynb

deploy:
	#deploy goes here
		
all: install lint deploy format test 

generate_and_push:
	# Create the markdown file (assuming it's generated from the plot)
	python test_main.py  # Replace with the actual command to generate the markdown

	# Add, commit, and push the generated files to GitHub
	@if [ -n "$$(git status --porcelain)" ]; then \
		git config --local user.email "action@github.com"; \
		git config --local user.name "GitHub Action"; \
		git add .; \
		git commit -m "Add generated plot and report"; \
		git push; \
	else \
		echo "No changes to commit. Skipping commit and push."; \
	fi