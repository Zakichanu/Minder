import * as React from 'react';

import Button from '@mui/material/Button';
import Card from '@mui/material/Card';
import CardActions from '@mui/material/CardActions';
import CardContent from '@mui/material/CardContent';
import CardMedia from '@mui/material/CardMedia';
import Typography from '@mui/material/Typography';

export default function CardEvent(props: any) {
  return (
    <Card sx={{ maxWidth: 300, maxHeight: 500, marginTop: 5, marginLeft: 5 }}>
      <CardMedia
          sx={{ height: 100 }}
          image={props.img}
          title={props.title}
        />
        <CardContent sx={{ height: 100 }}>
          <Typography gutterBottom variant="h5" component="div">
            {props.title}
          </Typography>
          <Typography variant="body2" color="text.secondary">
            {props.description}
          </Typography>
          <CardActions>
        <Button variant="outlined" color='secondary' size="small">Modifier</Button>
        <Button variant="outlined" color='secondary' size="small">Supprimer</Button>
      </CardActions>
        </CardContent>
      
    </Card>
  );
}
