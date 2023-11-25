import re
from  flask  import Flask,request,jsonify
import spacy 
app = Flask(__name__)
@app.route('/process',methods=['POST']) # type: ignore
def process_text(): 
    nlp = spacy.load("en_core_web_sm")
    data = request.get_json()
    if 'rectext' in data:
        text = data['rectext']
        doc = nlp(text)
        
            # Extract organization names based on the actual structure of the entities
        org_names = [ent.text for ent in doc.ents if ent.label_ == 'ORG']
        

        c_total = [ent.text for ent in doc.ents if ent.label_ == "MONEY" ]
        if c_total!=[]:
            total = [max([float(c) for c in c_total])]
            if len(total)>0:
                total=list(set(total))
            print(total,org_names[0])
            return jsonify({'org':org_names[0],'total': total}) 
        elif  c_total == []:
             money_pattern = re.compile(r'\b(?:Rs\s?|INR\s?|\$|€|£|¥)\s?(\d{1,3}(?:[.,]\d{3})*(?:[.,]\d{2})?)\b')
             c_total_matches = money_pattern.findall(text)
             print(c_total_matches)
             total = [max([float(c) for c in c_total_matches])]
             total = list(set(total))
             print(total,org_names[0])
             return jsonify({'org':org_names[0], 'total': total}) 
        else:
            return jsonify({'error': 'No MONEY entities found in the text or rectext not found in the request'})  # Handling missing 'rectext' or no MONEY entities


if __name__ =='__main__':
    app.run()