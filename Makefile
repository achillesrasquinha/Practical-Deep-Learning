install:
	cat requirements/*.txt          > requirements-dev.txt
	cat requirements/production.txt > requirements.txt

	pip install -r requirements-dev.txt
