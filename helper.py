import PyPDF2
import re

def extract_text_from_pdf(file_path):
    with open(file_path, 'rb') as file:
        pdf_reader = PyPDF2.PdfReader(file)
        text = ''
        numPages = len(pdf_reader.pages)
        for page_num in range(numPages):
            page = pdf_reader.pages[page_num]
            text += page.extract_text()
        return text.strip()

def clean_text(text):
    cleaned_text = re.sub(r'[^\w\s]', '', text)  # Remove special characters
    cleaned_text = cleaned_text.lower()  # Convert to lowercase
    return cleaned_text
