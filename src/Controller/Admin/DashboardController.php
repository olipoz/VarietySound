<?php

namespace App\Controller\Admin;

use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Album;
use App\Entity\Artiste;
use App\Entity\Genre;
use App\Entity\Music;
use App\Entity\Utilisateur;

class DashboardController extends AbstractDashboardController
{
    /**
     * @Route("/admin", name="admin")
     */
    public function index(): Response
    {
        //return parent::index();
        $routeBuilder = $this->get(AdminUrlGenerator::class);
        return $this->redirect($routeBuilder->setController(MusicCrudController::class)->generateUrl());
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle('ZAKSOUND');
    }
    
    public function configureMenuItems(): iterable
    {
        
        yield MenuItem::linktoDashboard('Tableau de bord', 'fa fa-home');
        yield MenuItem::linkToUrl('ZAKSOUND', 'fa fa-home','/');        
        yield MenuItem::linkToCrud('Albums', 'fas fa-compact-disc', Album::class);
        yield MenuItem::linkToCrud('Artistes', 'fas fa-guitar', Artiste::class);
        yield MenuItem::linkToCrud('Genre musique', 'fas fa-music', Genre::class);
        yield MenuItem::linkToCrud('Musiques', 'fas fa-headphones', Music::class);
        yield MenuItem::linkToCrud('Les utilisateurs', 'fas fa-user-tie', Utilisateur::class);
    }    
}
