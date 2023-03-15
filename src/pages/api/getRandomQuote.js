import { Author, QuoteSource } from "db/sequelize";
import { Sequelize } from "sequelize";

export default async function getRandomQuote(req,res){
    QuoteSource.findAll({ order: Sequelize.fn('RAND'), limit: 1, include:[{model:Author}]})
    .then(([quote]) => { 
        if(quote === undefined){
            const message = "Aucune citation n'a été trouvée.";
            res.status(404).json({message})
        }
        // console.log(quote);
        const message = "La citation a bien été récupérée";
        res.status(200).json({
            message, data:quote
        })
        
    })
    .catch(err => {
        console.log(err); 
        const message = "Erreur lors de la récupération des citations.";
        res.status(500).json({message})
    })
}

