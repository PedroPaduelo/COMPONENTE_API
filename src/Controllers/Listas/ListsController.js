const connection = require('../../database/connection')

module.exports = {

      async Index(request, response){
            
            const lists = await connection.select('*').from('lists')

            var listas = lists.map( async function(list) {

                  const cards = await connection.select('*').from('cards').where('list_id', list.id ).orderBy("order_id")

                  var labels = cards.map( async function(card) {
                        const label = await connection.select('*').from('labels').where('card_id', card.id);
                        return {    id : card.id,
                                    content : card.content,
                                    order_id: card.order_id,
                                    user : card.user,
                                    label: label || []
                              };
                  });

                  return Promise.all(labels).then((completed) => { 

                        return {    id : list.id,
                              title : list.title,
                              creatable : list.creatable,
                              done: list.done,
                              cards: completed
                        };
                  
                  });

                  
            });

            Promise.all(listas).then((completed) => { return response.json(completed)});
      },



      async UpdateList(request, response){

            const { id_list, id_card , id_card_to} = request.params;
            

            await connection('cards')
            .update({ list_id: id_list, id_list_card: id_card_to })
            .where('id', id_card)

            await connection('cards')
            .update({ list_id: id_list, id_list_card: id_card })
            .where('id', id_card_to)



            
            


            const lists = await connection.select('*').from('lists')

            var listas = lists.map( async function(list) {

                  const cards = await connection.select('*').from('cards').where('list_id', list.id ).orderBy("id_list_card")

                  var labels = cards.map( async function(card) {
                        const label = await connection.select('*').from('labels').where('card_id', card.id);
                        return {    id : card.id,
                                    content : card.content,
                                    id_list_card: card.id_list_card,
                                    user : card.user,
                                    label: label || []
                              };
                  });

                  return Promise.all(labels).then((completed) => { 

                        return {    id : list.id,
                              title : list.title,
                              creatable : list.creatable,
                              cards: completed
                        };
                  
                  });

                  
            });

            Promise.all(listas).then((completed) => { return response.json(completed)});

      },

      async CreateList(request, response){
            const {
                  title, 
                  done, 
                  email_user
            }  = request.body; 

            const created_at = new Date()
            const updated_at = new Date()

            await connection('tbl_list').insert({
                  title,
                  done,
                  email_user,
                  created_at,
                  updated_at
            })

            return response.json(true);
      },




    
}