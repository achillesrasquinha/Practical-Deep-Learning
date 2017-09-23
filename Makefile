install:
	cat requirements/*.txt          > Pipefile-dev
	cat requirements/production.txt > Pipefile

	pipenv install
