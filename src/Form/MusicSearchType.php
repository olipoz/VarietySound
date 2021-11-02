<?php

namespace App\Form;

use App\Entity\MusicSearch;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;

class MusicSearchType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('chercheTitre', TextType::class, [
                'required' => false,
                'label' => false,
                'attr' => [
                    'placeholder' => 'Cherche un titre'
                ]
            ])

            ->add('chercheAlbum', TextType::class, [
                'required' => false,
                'label' => false,
                'attr' => [
                    'placeholder' => 'chercher un album'
                ]
            ])

            ->add('chercheArtiste', TextType::class, [
                'required' => false,
                'label' => false,
                'attr' => [
                    'placeholder' => 'chercher un artiste'
                ]
            ])
            ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => MusicSearch::class,
            'method' => 'get',
            'csrf_protection' => false
        ]);
    }

    public function getBlockPrefix()
    {
        return '';
    }
}
