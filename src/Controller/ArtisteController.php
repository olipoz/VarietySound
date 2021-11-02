<?php

namespace App\Controller;

use App\Entity\Artiste;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class ArtisteController extends AbstractController
{
    #[Route('/artiste', name: 'artiste')]
    public function index(): Response
    {
        $artiste =$this->getDoctrine()
        ->getRepository(Artiste::class)
        ->findAll();

        return $this->render('artiste/index.html.twig', [
            'controller_name' => 'ArtisteController',
            'artiste' => $artiste,
        ]);
    }
}
