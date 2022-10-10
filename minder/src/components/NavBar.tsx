import * as React from 'react';

import AppBar from '@mui/material/AppBar';
import Box from '@mui/material/Box';
import Button from '@mui/material/Button';
import Toolbar from '@mui/material/Toolbar';

export default function ButtonAppBar() {
  return (
    <Box sx={{ flexGrow: 1 }}>
      <AppBar position="static">
        <Toolbar>
          
          <Box
            m="auto"
            component="img"
            sx={{
              height: 50,
              width: 150,
            }}
            alt="The house from the offer."
            src="../logo-complete@2x.png"
            onClick={() => window.location.href = "/"}
          />
          <Button color="inherit" onClick={() => window.location.href = "/SignupSC"}>Espace partenaires</Button>
        </Toolbar>
      </AppBar>
    </Box>
  );
}