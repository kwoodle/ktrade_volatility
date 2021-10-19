import argparse
parser = argparse.ArgumentParser()
parser.add_argument("file")
args=parser.parse_args()


from notebooktoall.transform import transform_notebook
transform_notebook(ipynb_file=args.file, export_list=["html", "py"])
